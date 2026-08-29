import Foundation
import SwiftData

public enum StorageRoomDataSourceFactory {
    public static func make(_ container: ModelContainer) -> StorageRoomDataSource {
        StorageRoomDataSourceImpl(modelContainer: container)
    }
}
