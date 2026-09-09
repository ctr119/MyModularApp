import SwiftUI
import StorageDomain

@MainActor
@Observable
public class StorageRoomListRouter {
    public enum Destination: Hashable {
        case moduleDetails(_ module: Module)
        case modulesList(_ modules: [Module])
        case newStoredItem(_ module: Module)
        case roomDetails(room: StorageRoom, targetModule: Module?)
    }

    var path: [Destination] = []
    private let depsContainer: StorageRoomDependenciesContainer

    public init(depsContainer: StorageRoomDependenciesContainer) {
        self.depsContainer = depsContainer
    }

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
        case .moduleDetails(let module):
            ModuleDetailsView(
                module: module,
                router: self,
            )

        case .modulesList(let modules):
            ModulesListView(
                modules: modules,
                router: self
            )

        case .newStoredItem(let module):
            NewStoredItemView(
                for: module,
                dependencies: depsContainer.newItemDependencies
            )

        case .roomDetails(let room, let targetModule):
            StorageRoomDetailsView(
                room: room,
                targetModule: targetModule,
                router: self
            )
        }
    }
}
