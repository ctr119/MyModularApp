import SwiftUI

@MainActor
@Observable
class NewModuleViewModel {
    var moduleName: String = ""
    var newItems: [NewItem] = []

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

    func save() async {
        
    }
}
