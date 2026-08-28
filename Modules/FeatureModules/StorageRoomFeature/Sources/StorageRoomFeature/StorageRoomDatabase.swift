import Foundation
import StorageData
import SwiftData
import SwiftUI

public enum StorageRoomDatabase {
    public static func getSchema() -> Schema {
        Schema(
            CurrentStorageRoomSchema.models,
            version: CurrentStorageRoomSchema.versionIdentifier
        )
    }
}
