import Foundation
import SwiftData

public typealias CurrentStorageRoomSchema = StorageRoomSchemaV1

public typealias StorageRoomEntity = CurrentStorageRoomSchema.StorageRoomEntity
public typealias ModuleEntity = CurrentStorageRoomSchema.ModuleEntity
public typealias StoredItemEntity = CurrentStorageRoomSchema.StoredItemEntity

public enum StorageRoomSchemaV1: VersionedSchema {
    public static let versionIdentifier: Schema.Version = .init(0, 0, 1)

    public static var models: [any PersistentModel.Type] {[
        StorageRoomEntity.self,
        ModuleEntity.self,
        StoredItemEntity.self
    ]}
}
