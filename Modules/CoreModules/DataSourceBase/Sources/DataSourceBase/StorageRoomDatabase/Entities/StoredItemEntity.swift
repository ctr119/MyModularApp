import Foundation
import SwiftData

extension StorageRoomSchemaV1 {
    @Model
    class StoredItemEntity {
        var iid: UUID
        var name: String
        var tags: [String]
        var moduleEntity: ModuleEntity?

        init(iid: UUID, name: String, tags: [String], moduleEntity: ModuleEntity? = nil) {
            self.iid = iid
            self.name = name
            self.tags = tags
            self.moduleEntity = moduleEntity
        }
    }
}
