import SwiftUI
import StorageDomain

@Observable
class StorageRoomListRouter {
    enum Destination: Hashable {
        case roomDetails(room: StorageRoom)
    }

    var path: NavigationPath = .init()

    func navigate(to destination: Destination) {
        path.append(destination)
    }

    @ViewBuilder
    func view(for destination: Destination) -> some View {
        switch destination {
        case .roomDetails(let room):
            StorageView(room: room)
        }
    }
}
