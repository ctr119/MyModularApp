import Foundation
import DataSourceBase
import StorageData
import StorageDomain
import StoragePresentation
import SwiftData
import SwiftUI

@MainActor
public enum StorageRoomFactory {
    public static func make(
        container: ModelContainer?
    ) -> some View {
        guard let container else { fatalError("No container was found") }

        let dataSource = StorageRoomDataSourceFactory.make(container)
        let storageRoomRepository = StorageRoomRepository(storageRoomDataSource: dataSource)

        let roomListDependencies = StorageRoomListDependencies(
            getStorageRoomsUseCase: storageRoomRepository
        )

        let newStoredItemDependencies = NewStoredItemDependencies(
            saveItemUseCase: storageRoomRepository
        )

        let modulePositionDependencies = ModulePositionDependencies(
            saveItemUseCase: storageRoomRepository
        )

        let newStorageRoomDependencies = NewStorageRoomDependencies(
            saveItemUseCase: storageRoomRepository
        )

        let storageRoomDetailsDependencies = StorageRoomDetailsDependencies(
            getStorageRoomDetailsUseCase: storageRoomRepository
        )

        let moduleDetailsDependencies = ModuleDetailsDependencies(
            getModuleDetailsUseCase: storageRoomRepository
        )

        let dependenciesContainer = StorageRoomDependenciesContainer(
            roomListDependencies: roomListDependencies,
            newItemDependencies: newStoredItemDependencies,
            modulePositionDependencies: modulePositionDependencies,
            newStorageRoomDependencies: newStorageRoomDependencies,
            storageRoomDetailsDependencies: storageRoomDetailsDependencies,
            moduleDetailsDependencies: moduleDetailsDependencies
        )

        return StorageRoomListView(
            dependencies: dependenciesContainer,
        )
    }
}
