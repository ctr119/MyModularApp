import Foundation

extension Request {
    var timeoutInterval: TimeInterval { 30.0 }

    func urlRequest(
        with baseUrl: URL?,
        authorisation token: String? = nil,
        sharedHeaders: [String: String]? = nil
    ) throws -> URLRequest {
        guard let baseUrl,
              var urlComponents = URLComponents(
                url: baseUrl.appending(component: path),
                resolvingAgainstBaseURL: true
              ) else {
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

        var requestHeaders = headers
        if let sharedHeaders {
            requestHeaders?.merge(sharedHeaders, uniquingKeysWith: { currentValue, _ in
                currentValue
            })
        }

        requestHeaders?.forEach { key, value in
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
