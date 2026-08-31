import SwiftUI
import StorageDomain

@MainActor
@Observable
class StorageRoomListRouter {
    enum Destination: Hashable {
        case modulesList(_ modules: [Module])
        case roomDetails(room: StorageRoom, targetModule: Module?)
    }

    var path: [Destination] = []

    func navigate(to destination: Destination) {
        path.append(destination)
    }

    func back() {
        _ = path.popLast()
    }

    func back<T>(returning value: T) {
        back()
        let destination = path.popLast()
        
        if case let .roomDetails(room, _) = destination,
            let targetModule = value as? Module {
            navigate(to: .roomDetails(room: room, targetModule: targetModule))

        } else if let destination {
            navigate(to: destination)
        }
    }

    @ViewBuilder
    func view(for destination: Destination) -> some View {
        switch destination {
        case .modulesList(let modules):
            ModulesListView(modules: modules, router: self)

        case .roomDetails(let room, let targetModule):
            StorageRoomDetailsView(
                room: room,
                targetModule: targetModule,
                router: self
            )
        }
    }
}
