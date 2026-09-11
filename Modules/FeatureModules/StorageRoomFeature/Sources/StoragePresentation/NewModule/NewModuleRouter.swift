import SwiftUI
import StorageDomain

@MainActor
@Observable
final class NewModuleRouter {
    enum Destination: Hashable {
        case positionStep(module: Module, room: StorageRoom)
    }

    var path: [Destination] = []
    private let modulePositionDependencies: ModulePositionDependencies

    init(modulePositionDependencies: ModulePositionDependencies) {
        self.modulePositionDependencies = modulePositionDependencies
    }

    func navigate(to destination: Destination) {
        path.append(destination)
    }

    @ViewBuilder
    func view(for destination: Destination) -> some View {
        switch destination {
        case .positionStep(let module, let room):
            ModulePositionView(
                module: module,
                room: room,
                dependencies: modulePositionDependencies
            )
        }
    }
}
