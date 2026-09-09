import StorageDomain
import SwiftUI

@MainActor
@Observable
class NewStoredItemViewModel {
    var itemName: String = ""
    var tags: [String] = []

    @ObservationIgnored
    private let module: Module
    @ObservationIgnored
    private let saveItemUseCase: SaveItemUseCase

    init(
        module: Module,
        dependencies: NewStoredItemDependencies
    ) {
        self.module = module
        self.saveItemUseCase = dependencies.saveItemUseCase
    }

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

        await saveItemUseCase.save(item: newItem, in: module)
    }
}
