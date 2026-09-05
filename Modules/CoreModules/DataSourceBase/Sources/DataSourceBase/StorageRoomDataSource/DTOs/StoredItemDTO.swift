import Foundation

public struct StoredItemDTO: Sendable {
    public let id: UUID
    public let name: String
    public let tags: [String]
    public let module: ModuleDTO?

    public init(
        id: UUID,
        name: String,
        tags: [String],
        module: ModuleDTO?
    ) {
        self.id = id
        self.name = name
        self.tags = tags
        self.module = module
    }
}

extension StoredItemEntity {
    var toDto: StoredItemDTO {
        .init(
            id: self.id,
            name: self.name,
            tags: self.tags,
            module: self.moduleEntity?.toDto
        )
    }
}

extension StoredItemDTO {
    func toEntity(in module: ModuleEntity? = nil) -> StoredItemEntity {
        .init(
            id: self.id,
            name: self.name,
            tags: self.tags,
            moduleEntity: module
        )
    }
}
