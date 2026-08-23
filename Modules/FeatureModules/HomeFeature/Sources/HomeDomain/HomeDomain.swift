import Foundation

public struct FeedItem: Identifiable, Sendable {
    public let id: String
    public let title: String

    public init(id: String, title: String) {
        self.id = id
        self.title = title
    }
}

public protocol GetHomeFeedUseCaseProtocol: Sendable {
    func execute() async throws -> [FeedItem]
}
