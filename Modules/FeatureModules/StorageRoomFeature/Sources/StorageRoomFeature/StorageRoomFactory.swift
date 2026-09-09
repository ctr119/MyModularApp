import Foundation
import DataSourceBase
import StorageData
import StorageDomain
import StoragePresentation
import SwiftData
import SwiftUI

@MainActor
enum StorageRoomFactory {
    static func make(
        container: ModelContainer
    ) -> some View {
        let dataSource = StorageRoomDataSourceFactory.make(container)
        let storageRoomRepository = StorageRoomRepository(storageRoomDataSource: dataSource)

        let roomListDependencies = StorageRoomListDependencies(
            getStorageRoomsUseCase: storageRoomRepository
        )

        let newStoredItemDependencies = NewStoredItemDependencies(
            saveItemUseCase: storageRoomRepository
        )

        let dependenciesContainer = StorageRoomDependenciesContainer(
            roomListDependencies: roomListDependencies,
            newItemDependencies: newStoredItemDependencies
        )

        return StorageRoomListView(
            dependencies: dependenciesContainer,
        )
    }
}
