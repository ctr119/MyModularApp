import SwiftUI
import StorageDomain

public final class StorageRoomDependenciesContainer {
    static func mock() -> StorageRoomDependenciesContainer {
        .init(
            roomListDependencies: .mock(),
            newItemDependencies: .mock(),
            modulePositionDependencies: .mock(),
            newStorageRoomDependencies: .mock(),
            storageRoomDetailsDependencies: .mock()
        )
    }

    let roomListDependencies: StorageRoomListDependencies
    let newItemDependencies: NewStoredItemDependencies
    let modulePositionDependencies: ModulePositionDependencies
    let newStorageRoomDependencies: NewStorageRoomDependencies
    let storageRoomDetailsDependencies: StorageRoomDetailsDependencies

    public init(
        roomListDependencies: StorageRoomListDependencies,
        newItemDependencies: NewStoredItemDependencies,
        modulePositionDependencies: ModulePositionDependencies,
        newStorageRoomDependencies: NewStorageRoomDependencies,
        storageRoomDetailsDependencies: StorageRoomDetailsDependencies
    ) {
        self.roomListDependencies = roomListDependencies
        self.newItemDependencies = newItemDependencies
        self.modulePositionDependencies = modulePositionDependencies
        self.newStorageRoomDependencies = newStorageRoomDependencies
        self.storageRoomDetailsDependencies = storageRoomDetailsDependencies
    }
}
