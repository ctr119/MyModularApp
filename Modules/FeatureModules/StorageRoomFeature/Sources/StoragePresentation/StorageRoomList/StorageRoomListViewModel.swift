import StorageDomain
import SwiftUI

@MainActor
@Observable
class StorageRoomListViewModel {
    var rooms: [StorageRoom] = []

    @ObservationIgnored
    private let getStorageRoomsUseCase: GetStorageRoomsUseCase

    init(dependencies: StorageRoomListDependencies) {
        self.getStorageRoomsUseCase = dependencies.getStorageRoomsUseCase
    }

    func loadRooms() async {
        let rooms = await getStorageRoomsUseCase()
        self.rooms = rooms
    }
}
