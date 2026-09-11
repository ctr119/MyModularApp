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

    init(module: Module, room: StorageRoom) {
        self.module = module
        self.room = room
    }

    func save() async {
        // TODO: Convert values and persist the new items
    }
}
