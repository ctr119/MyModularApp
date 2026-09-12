import StorageDomain
import SwiftUI

@MainActor
@Observable
class StorageRoomDetailsViewModel {
    var room: StorageRoom

    private let getStorageRoomDetails: GetStorageRoomDetailsUseCase

    init(
        dependencies: StorageRoomDetailsDependencies,
        room: StorageRoom
    ) {
        self.getStorageRoomDetails = dependencies.getStorageRoomDetailsUseCase
        self.room = room
    }

    func refreshDetails() async {
        guard let refreshedRoom = await getStorageRoomDetails(room.id) else {
            return
        }
        self.room = refreshedRoom
    }
}
