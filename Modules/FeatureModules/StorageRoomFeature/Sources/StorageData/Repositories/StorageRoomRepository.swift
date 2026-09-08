import DataSourceBase
import Foundation
import StorageDomain

final class StorageRoomRepository: Sendable {
    private let storageRoomDataSource: StorageRoomDataSource

    init(storageRoomDataSource: StorageRoomDataSource) {
        self.storageRoomDataSource = storageRoomDataSource
    }
}

extension StorageRoomRepository: GetStorageRoomsUseCase {
    func callAsFunction() async -> [StorageRoom] {
        do {
            let rooms = try await storageRoomDataSource.fetchRooms(10, hydratingModules: true)
            return rooms.compactMap { $0.toDomain }
        } catch {
            return []
        }
    }
}
