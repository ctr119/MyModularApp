import SwiftUI
import StorageDomain

public final class StorageRoomDependenciesContainer {
    static func mock() -> StorageRoomDependenciesContainer {
        .init(
            roomListDependencies: .mock(),
            newItemDependencies: .mock(),
            modulePositionDependencies: .mock()
        )
    }

    let roomListDependencies: StorageRoomListDependencies
    let newItemDependencies: NewStoredItemDependencies
    let modulePositionDependencies: ModulePositionDependencies

    public init(
        roomListDependencies: StorageRoomListDependencies,
        newItemDependencies: NewStoredItemDependencies,
        modulePositionDependencies: ModulePositionDependencies
    ) {
        self.roomListDependencies = roomListDependencies
        self.newItemDependencies = newItemDependencies
        self.modulePositionDependencies = modulePositionDependencies
    }
}
