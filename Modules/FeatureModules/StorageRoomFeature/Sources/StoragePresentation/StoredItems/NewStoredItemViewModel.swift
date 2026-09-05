import StorageDomain
import SwiftUI

@MainActor
@Observable
class NewStoredItemViewModel {
    var itemName: String = ""
    var tags: [String] = []

    func add(tag: String) {
        guard !tags.contains(tag) else {
            return
        }
        tags.append(tag)
    }

    func save() async {
        let newItem = StoredItem(
            id: UUID(),
            name: itemName,
            tags: tags
        )

        // TODO: Save into the database
    }
}
