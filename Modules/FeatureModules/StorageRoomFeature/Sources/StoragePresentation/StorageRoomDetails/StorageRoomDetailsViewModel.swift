import StorageDomain
import SwiftUI

@MainActor
@Observable
class StorageRoomDetailsViewModel {
    var room: StorageRoom
    var targetModule: Module?

    private let getStorageRoomDetails: GetStorageRoomDetailsUseCase

    init(
        dependencies: StorageRoomDetailsDependencies,
        room: StorageRoom,
        targetModule: Module?
    ) {
        self.room = room
        self.targetModule = targetModule
        self.getStorageRoomDetails = dependencies.getStorageRoomDetailsUseCase
    }

    func refreshDetails() async {
        guard let refreshedRoom = await getStorageRoomDetails(room.id) else {
            return
        }
        self.room = refreshedRoom
    }
}
