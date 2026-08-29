import Foundation
import SwiftData

public enum StorageRoomDatabase {
    public static func getSchema() -> Schema {
        Schema(
            CurrentStorageRoomSchema.models,
            version: CurrentStorageRoomSchema.versionIdentifier
        )
    }
}
