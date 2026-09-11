import StorageDomain
import SwiftUI

@MainActor
@Observable
class ModulePositionViewModel {
    var position: Module.Position = .zero

    @ObservationIgnored
    let module: Module
    @ObservationIgnored
    let room: StorageRoom

    @ObservationIgnored
    private let saveItemUseCase: SaveItemUseCase

    init(
        module: Module,
        room: StorageRoom,
        dependencies: ModulePositionDependencies
    ) {
        self.module = module
        self.room = room
        self.saveItemUseCase = dependencies.saveItemUseCase
    }

    func save() async {
        let finalModule = module.copy(position: position)

        await saveItemUseCase.save(item: finalModule, in: room)
    }
}
