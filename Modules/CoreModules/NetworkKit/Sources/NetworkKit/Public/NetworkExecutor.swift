import Foundation

public protocol NetworkExecutor: Sendable {
    func execute<T: Decodable>(request: any Request) async throws -> T
}

public struct NetworkConfiguration: Sendable {
    public let baseUrl: URL?
    public let isAuthenticationEnabled: Bool
    public let sessionDelegate: URLSessionDelegate?
    public let sharedHeaders: [String: String]?

    public init(
        baseUrl: URL?,
        isAuthenticationEnabled: Bool = true,
        sessionDelegate: URLSessionDelegate? = nil,
        sharedHeaders: [String: String]? = nil
    ) {
        self.baseUrl = baseUrl
        self.isAuthenticationEnabled = isAuthenticationEnabled
        self.sessionDelegate = sessionDelegate
        self.sharedHeaders = sharedHeaders
    }

    public static func baseUrl(_ url: URL?) -> NetworkConfiguration {
        .init(baseUrl: url)
    }
}

public enum NetworkExecutorFactory {
    public static func make(with configuration: NetworkConfiguration) -> NetworkExecutor {
        let session = URLSession(
            configuration: .default,
            delegate: configuration.sessionDelegate,
            delegateQueue: nil
        )

        let client = NetworkClientImplementation(
            session: session,
            decoder: JSONDecoder()
        )

        return NetworkExecutorImplementation(
            client: client,
            tokenStore: .shared,
            configuration: configuration
        )
    }
}
