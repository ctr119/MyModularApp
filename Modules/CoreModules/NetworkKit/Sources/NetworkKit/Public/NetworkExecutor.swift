import Foundation

public protocol NetworkExecutor {
    func execute<T: Decodable>(request: any Request) async throws -> T
}

public enum NetworkExecutorFactory {
    public static func make() -> NetworkExecutor {
        let baseUrl = URL(string: "http://<your-domain>.com")!
        let client = NetworkClientImplementation(session: .shared, decoder: JSONDecoder())

        return NetworkExecutorImplementation(
            baseUrl: baseUrl,
            client: client,
            tokenStore: .shared
        )
    }
}
