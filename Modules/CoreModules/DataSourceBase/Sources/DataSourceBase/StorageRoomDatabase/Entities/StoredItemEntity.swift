import Foundation
import SwiftData

extension StorageRoomSchemaV1 {
    @Model
    class StoredItemEntity {
        var id: UUID
        var name: String
        var tags: [String]
        var moduleEntity: ModuleEntity?

        init(id: UUID, name: String, tags: [String], moduleEntity: ModuleEntity? = nil) {
            self.id = id
            self.name = name
            self.tags = tags
            self.moduleEntity = moduleEntity
        }
    }
}
