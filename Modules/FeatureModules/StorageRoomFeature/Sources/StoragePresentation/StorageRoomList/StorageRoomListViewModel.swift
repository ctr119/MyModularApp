import StorageDomain
import SwiftUI

@MainActor
@Observable
class StorageRoomListViewModel {
    var rooms: [StorageRoom] = []
    var router: StorageRoomListRouter = .init()

    @ObservationIgnored
    private let getStorageRoomsUseCase: GetStorageRoomsUseCase

    init(dependencies: StorageRoomListDependencies) {
        self.getStorageRoomsUseCase = dependencies.getStorageRoomsUseCase
    }

    func loadRooms() async {
        let rooms = await getStorageRoomsUseCase()
        self.rooms = rooms
    }

    func didTapRoom(_ room: StorageRoom) {
        router.navigate(to: .roomDetails(room: room))
    }
}
