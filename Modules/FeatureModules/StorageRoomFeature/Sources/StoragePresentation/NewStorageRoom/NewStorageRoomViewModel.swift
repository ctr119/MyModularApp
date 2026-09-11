import StorageDomain
import SwiftUI

@MainActor
@Observable
class NewStorageRoomViewModel {
    var roomName: String = ""
    var cellSize: MeasureModel = .init(amount: 1, unit: .m)
    var rows: Int = 1
    var cols: Int = 1

    private let saveItemUseCase: SaveItemUseCase

    init(dependencies: NewStorageRoomDependencies) {
        self.saveItemUseCase = dependencies.saveItemUseCase
    }

    func save() async {
        let newRoom = StorageRoom(
            id: UUID(),
            name: roomName,
            cellSize: cellSize.toDomain,
            gridRows: rows,
            gridCols: cols,
            modules: []
        )

        await saveItemUseCase.save(item: newRoom)
    }
}
