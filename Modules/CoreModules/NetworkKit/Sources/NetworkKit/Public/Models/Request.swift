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
