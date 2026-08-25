import Foundation

public protocol TokenRefreshDelegate: Sendable {
    func refresh() async throws -> String
}
