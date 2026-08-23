import Foundation

public protocol TokenRefresherProtocol: Sendable {
    func refresh() async throws -> String
}
