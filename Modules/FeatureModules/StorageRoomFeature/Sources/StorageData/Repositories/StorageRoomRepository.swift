import DataSourceBase
import Foundation
import StorageDomain

public final class StorageRoomRepository: Sendable {
    private let storageRoomDataSource: StorageRoomDataSource

    public init(storageRoomDataSource: StorageRoomDataSource) {
        self.storageRoomDataSource = storageRoomDataSource
    }
}

extension StorageRoomRepository: GetStorageRoomsUseCase {
    public func callAsFunction() async -> [StorageRoom] {
        do {
            let rooms = try await storageRoomDataSource.fetchRooms(10, hydratingModules: true)
            return rooms.compactMap { $0.toDomain }
        } catch {
            return []
        }
    }
}

extension StorageRoomRepository: SaveItemUseCase {
    public func save<T, P>(item: T, in parent: P? = nil) async {
        do {
            if let storedItem = item as? StoredItem, let module = parent as? Module {
                try await storageRoomDataSource.add(
                    item: storedItem.toDto,
                    to: module.toDto
                )
            } else if let module = item as? Module, let room = parent as? StorageRoom {
                try await storageRoomDataSource.add(
                    module: module.toDto,
                    to: room.toDto
                )
            } else if let room = item as? StorageRoom {
                try await storageRoomDataSource.add(
                    room: room.toDto
                )
            }
        } catch {
            // TODO: Implement me!
        }
    }
}
