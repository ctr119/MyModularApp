import SwiftUI
import StorageDomain

public final class StorageRoomDependenciesContainer {
    static func mock() -> StorageRoomDependenciesContainer {
        .init(
            roomListDependencies: .mock(),
            newItemDependencies: .mock()
        )
    }

    let roomListDependencies: StorageRoomListDependencies
    let newItemDependencies: NewStoredItemDependencies

    public init(
        roomListDependencies: StorageRoomListDependencies,
        newItemDependencies: NewStoredItemDependencies
    ) {
        self.roomListDependencies = roomListDependencies
        self.newItemDependencies = newItemDependencies
    }
}
