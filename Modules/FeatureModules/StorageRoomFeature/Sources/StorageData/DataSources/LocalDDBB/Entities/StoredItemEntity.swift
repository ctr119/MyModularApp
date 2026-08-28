import Foundation
import SwiftData

extension StorageRoomSchemaV1 {
    @Model
    public class StoredItemEntity {
        public var id: UUID
        public var name: String
        public var tags: [String]
        public var moduleEntity: ModuleEntity?

        init(id: UUID, name: String, tags: [String], moduleEntity: ModuleEntity? = nil) {
            self.id = id
            self.name = name
            self.tags = tags
            self.moduleEntity = moduleEntity
        }
    }
}
