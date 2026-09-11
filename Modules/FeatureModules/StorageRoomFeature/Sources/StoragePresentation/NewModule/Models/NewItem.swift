import Foundation
import StorageDomain

struct NewItem: Identifiable, Equatable {
    var id: String { name }
    let name: String
    var tags: [String] = []
}

extension NewItem {
    var toDomain: StoredItem {
        .init(
            id: UUID(),
            name: self.name,
            tags: self.tags
        )
    }
}
