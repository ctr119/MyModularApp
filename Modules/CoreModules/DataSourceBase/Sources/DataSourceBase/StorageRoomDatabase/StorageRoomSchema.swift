import Foundation
import SwiftData

typealias CurrentStorageRoomSchema = StorageRoomSchemaV1

typealias StorageRoomEntity = CurrentStorageRoomSchema.StorageRoomEntity
typealias ModuleEntity = CurrentStorageRoomSchema.ModuleEntity
typealias StoredItemEntity = CurrentStorageRoomSchema.StoredItemEntity

enum StorageRoomSchemaV1: VersionedSchema {
    static let versionIdentifier: Schema.Version = .init(0, 0, 1)

    static var models: [any PersistentModel.Type] {[
        StorageRoomEntity.self,
        ModuleEntity.self,
        StoredItemEntity.self
    ]}
}
