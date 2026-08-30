import Foundation
import SwiftData

public enum StorageRoomDatabase {
    private static func getSchema() -> Schema {
        Schema(
            CurrentStorageRoomSchema.models,
            version: CurrentStorageRoomSchema.versionIdentifier
        )
    }

    public static func getContainer(forPreviews: Bool = false) -> ModelContainer {
        let schema = StorageRoomDatabase.getSchema()
        let configuration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: forPreviews)
        do {
            return try ModelContainer(for: schema, configurations: configuration)
        } catch {
            let errorMessage = "SwiftData couldn't load StorageRoomDatabase. Error: \(error.localizedDescription)"
            fatalError(errorMessage)
        }
    }
}
