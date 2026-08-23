import Foundation

public protocol Request<Payload> {
    associatedtype Payload: Encodable

    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var payload: Payload? { get set }

    var queryParameters: [String: String]? { get }
    var timeoutInterval: TimeInterval { get }
}

extension Request {
    var timeoutInterval: TimeInterval { 30.0 }

    func urlRequest(with baseUrl: URL, authorisation token: String? = nil) throws -> URLRequest {
        let fullUrl = baseUrl.appending(component: path)

        guard var urlComponents = URLComponents(url: fullUrl, resolvingAgainstBaseURL: true) else {
            throw NetworkError.invalidURL
        }

        if let queryParameters, !queryParameters.isEmpty {
            urlComponents.queryItems = queryParameters.map {
                URLQueryItem(name: $0.key, value: $0.value)
            }
        }

        guard let url = urlComponents.url else {
            throw NetworkError.invalidURL
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.timeoutInterval = timeoutInterval

        headers?.forEach { key, value in
            urlRequest.addValue(value, forHTTPHeaderField: key)
        }

        if let token {
            urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }

        if let payload {
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try JSONEncoder().encode(payload)
        }

        return urlRequest
    }
}
