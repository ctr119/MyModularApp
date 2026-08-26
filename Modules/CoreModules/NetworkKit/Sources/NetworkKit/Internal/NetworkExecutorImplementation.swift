import Foundation

final class NetworkExecutorImplementation: NetworkExecutor {
    private let MAX_ATTEMPTS = 1

    private let client: NetworkClient
    private let tokenStore: TokenStore
    private let configuration: NetworkConfiguration

    init(client: NetworkClient, tokenStore: TokenStore, configuration: NetworkConfiguration) {
        self.client = client
        self.tokenStore = tokenStore
        self.configuration = configuration
    }

    func execute<T: Decodable>(request: any Request) async throws -> T {
        var attempts = 0

        while true {
            let token: String? = if configuration.isAuthenticationEnabled {
                try await tokenStore.getAccessToken()
            } else { nil }

            let urlRequest = try request.urlRequest(
                with: configuration.baseUrl,
                authorisation: token,
                sharedHeaders: configuration.sharedHeaders
            )

            do {
                return try await client.perform(urlRequest: urlRequest)

            } catch NetworkError.httpError(let statusCode, let data) {
                if configuration.isAuthenticationEnabled, statusCode == 401 {
                    if attempts < MAX_ATTEMPTS {
                        try await tokenStore.refreshToken()
                        attempts += 1
                        continue
                    } else {
                        throw NetworkError.maxNumberOfRetriesReached
                    }
                }

                throw NetworkError.httpError(
                    statusCode: statusCode,
                    data: data
                )
            }
        }
    }
}
