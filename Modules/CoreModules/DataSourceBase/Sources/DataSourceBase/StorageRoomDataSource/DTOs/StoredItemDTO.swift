import Foundation

public struct StoredItemDTO: Sendable {
    public let id: UUID
    public let name: String
    public let tags: [String]

    public init(
        id: UUID,
        name: String,
        tags: [String],
    ) {
        self.id = id
        self.name = name
        self.tags = tags
    }
}

extension StoredItemEntity {
    var toDto: StoredItemDTO {
        .init(
            id: self.iid,
            name: self.name,
            tags: self.tags
        )
    }
}

extension StoredItemDTO {
    func toEntity(in module: ModuleEntity? = nil) -> StoredItemEntity {
        .init(
            iid: self.id,
            name: self.name,
            tags: self.tags,
            moduleEntity: module
        )
    }
}
