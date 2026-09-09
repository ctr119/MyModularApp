import SwiftUI

@MainActor
@Observable
class NewModuleViewModel {
    var moduleName: String = ""
    private(set) var newItems: [String] = [
        "Pots"
    ]

    func add(item: String) {
        guard !newItems.contains(item) else {
            return
        }
        newItems.append(item)
    }

    func remove(item: String) {
        guard newItems.contains(item) else {
            return
        }
        newItems.removeAll {
            $0 == item
        }
    }

    func save() async {
        
    }
}
