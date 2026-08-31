import DataSourceBase
import Foundation
import StorageDomain

extension StoredItemDTO {
    var toDomain: StoredItem {
        .init(
            id: self.id,
            name: self.name,
            tags: self.tags
        )
    }
}
