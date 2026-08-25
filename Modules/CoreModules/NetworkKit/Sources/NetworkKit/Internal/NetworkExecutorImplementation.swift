import Foundation

final class NetworkExecutorImplementation: NetworkExecutor {
    private let MAX_ATTEMPTS = 1

    private let baseUrl: URL
    private let client: NetworkClient
    private let tokenStore: TokenStore

    init(baseUrl: URL, client: NetworkClient, tokenStore: TokenStore) {
        self.baseUrl = baseUrl
        self.client = client
        self.tokenStore = tokenStore
    }

    func execute<T: Decodable>(request: any Request) async throws -> T {
        var attempts = 0

        while true {
            let token = try await tokenStore.getAccessToken()
            let urlRequest = try request.urlRequest(with: baseUrl, authorisation: token)

            do {
                return try await client.perform(urlRequest: urlRequest)

            } catch NetworkError.httpError(let statusCode, _) {
                if statusCode == 401, attempts < MAX_ATTEMPTS {
                    try await tokenStore.refreshToken()
                    attempts += 1
                    continue
                }

                throw NetworkError.maxNumberOfRetriesReached
            }
        }
    }
}
