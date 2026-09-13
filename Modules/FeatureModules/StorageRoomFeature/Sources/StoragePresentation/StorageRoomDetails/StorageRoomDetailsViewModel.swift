import StorageDomain
import SwiftUI

@MainActor
@Observable
class StorageRoomDetailsViewModel {
    var room: StorageRoom

    private let getStorageRoomDetails: GetStorageRoomDetailsUseCase
    private let deleteItemUseCase: DeleteItemUseCase

    init(
        dependencies: StorageRoomDetailsDependencies,
        room: StorageRoom
    ) {
        self.getStorageRoomDetails = dependencies.getStorageRoomDetailsUseCase
        self.deleteItemUseCase = dependencies.deleteItemUseCase
        self.room = room
    }

    func refreshDetails() async {
        guard let refreshedRoom = await getStorageRoomDetails(room.id) else {
            return
        }
        self.room = refreshedRoom
    }

    func deleteRoom() async {
        await deleteItemUseCase.delete(item: room)
    }
}
