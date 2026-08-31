import Foundation

public struct StoredItem: Hashable, Identifiable, Sendable {
    public let id: UUID
    public let name: String
    public let tags: [String]

    public init(id: UUID, name: String, tags: [String]) {
        self.id = id
        self.name = name
        self.tags = tags
    }
}
