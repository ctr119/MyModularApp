import StorageDomain
import SwiftUI

@Observable
class NewStorageRoomViewModel {
    var roomName: String = ""
    var cellSize: MeasureModel = .init(amount: 1, unit: .m)
    var rows: Int = 1
    var cols: Int = 1

    func save() async {
        // TODO: Inject UseCase
    }
}
