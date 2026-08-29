import DataSourceBase
import Foundation
import SearchDomain

extension StoredItemDTO {
    var toDomain: SearchItem? {
        guard let module = self.module,
              let room = module.storageRoom else {
            return nil
        }

        return SearchItem(
            id: self.id,
            name: self.name,
            module: .init(
                id: module.id,
                name: module.label
            ),
            room: .init(
                id: room.id,
                name: room.name
            )
        )
    }
}
