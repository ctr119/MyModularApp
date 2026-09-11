import SwiftUI
import StorageDomain

@MainActor
@Observable
class NewModuleViewModel {
    var moduleName: String = ""
    var widthMeasure: MeasureModel = .init()
    var depthMeasure: MeasureModel = .init()
    var newItems: [NewItem] = []
    var router: NewModuleRouter = .init()

    func add(item: String) {
        guard !newItems.contains(where: { $0.id == item }) else {
            return
        }
        newItems.append(NewItem(name: item))
    }

    func remove(item: String) {
        newItems.removeAll {
            $0.id == item
        }
    }

    func nextSetp() {
        let room = StorageRoom.mock // TODO: Use the real one

        let newModule = Module(
            id: UUID(),
            label: moduleName,
            realWidth: widthMeasure.toDomain,
            realDepth: depthMeasure.toDomain,
            position: .zero,
            items: newItems.map { $0.toDomain }
        )

        router.navigate(
            to: .positionStep(
                module: newModule,
                room: room
            )
        )
    }

    func save() async {
        // TODO: Convert values and persist the new items
    }
}
