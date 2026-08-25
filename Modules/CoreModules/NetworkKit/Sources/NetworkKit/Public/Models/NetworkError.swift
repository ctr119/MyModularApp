import Foundation

public enum NetworkError: Error, LocalizedError {
    case invalidURL
    case noData
    case decodingError(Error)
    case httpError(statusCode: Int, data: Data?)
    case networkError(Error)
    case maxNumberOfRetriesReached
    case missingTokenRefreshDelegate

    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            "Invalid URL"
        case .noData:
            "No data received"
        case .decodingError(let error):
            "Decoding error: \(error.localizedDescription)"
        case .httpError(let statusCode, _):
            "HTTP error with status code: \(statusCode)"
        case .networkError(let error):
            "Network error: \(error.localizedDescription)"
        case .maxNumberOfRetriesReached:
            "Max retries reached"
        case .missingTokenRefreshDelegate:
            "There is no `TokenRefreshDelegate` assigned"
        }
    }
}
