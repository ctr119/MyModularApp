import Foundation

protocol NetworkClient: Sendable {
    func perform<T: Decodable>(urlRequest: URLRequest) async throws -> T
}

final class NetworkClientImplementation: NetworkClient {
    private let session: URLSession
    private let decoder: JSONDecoder

    init(session: URLSession, decoder: JSONDecoder) {
        self.session = session
        self.decoder = decoder
    }

    func perform<T: Decodable>(urlRequest: URLRequest) async throws -> T {
        let (data, response) = try await session.data(for: urlRequest)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.networkError(URLError(.badServerResponse))
        }

        guard 200..<300 ~= httpResponse.statusCode else {
            throw NetworkError.httpError(
                statusCode: httpResponse.statusCode,
                data: data
            )
        }

        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            print("[ApiClient] Decoding Error: \(String(describing: error))")

            if let responseDataString = String(data: data, encoding: .utf8) {
                print("[ApiClient] Failure when decoding data into '\(T.self)'. Data: \(responseDataString)")
            }

            throw NetworkError.decodingError(error)
        }
    }
}
