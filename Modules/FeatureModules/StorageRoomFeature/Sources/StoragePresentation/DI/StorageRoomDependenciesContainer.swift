import SwiftUI
import StorageDomain

public final class StorageRoomDependenciesContainer {
    static func mock() -> StorageRoomDependenciesContainer {
        .init(
            roomListDependencies: .mock(),
            newItemDependencies: .mock(),
            modulePositionDependencies: .mock(),
            newStorageRoomDependencies: .mock(),
            storageRoomDetailsDependencies: .mock(),
            moduleDetailsDependencies: .mock()
        )
    }

    let roomListDependencies: StorageRoomListDependencies
    let newItemDependencies: NewStoredItemDependencies
    let modulePositionDependencies: ModulePositionDependencies
    let newStorageRoomDependencies: NewStorageRoomDependencies
    let storageRoomDetailsDependencies: StorageRoomDetailsDependencies
    let moduleDetailsDependencies: ModuleDetailsDependencies

    public init(
        roomListDependencies: StorageRoomListDependencies,
        newItemDependencies: NewStoredItemDependencies,
        modulePositionDependencies: ModulePositionDependencies,
        newStorageRoomDependencies: NewStorageRoomDependencies,
        storageRoomDetailsDependencies: StorageRoomDetailsDependencies,
        moduleDetailsDependencies: ModuleDetailsDependencies
    ) {
        self.roomListDependencies = roomListDependencies
        self.newItemDependencies = newItemDependencies
        self.modulePositionDependencies = modulePositionDependencies
        self.newStorageRoomDependencies = newStorageRoomDependencies
        self.storageRoomDetailsDependencies = storageRoomDetailsDependencies
        self.moduleDetailsDependencies = moduleDetailsDependencies
    }
}
