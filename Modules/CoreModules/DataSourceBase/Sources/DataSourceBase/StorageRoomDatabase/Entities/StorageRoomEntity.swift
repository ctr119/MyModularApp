import Foundation
import SwiftData

extension StorageRoomSchemaV1 {
    @Model
    class StorageRoomEntity {
        var rid: UUID
        var name: String
        var cellSizeAmount: Decimal
        var cellSizeUnit: Int
        var gridRows: Int
        var gridCols: Int

        @Relationship(inverse: \ModuleEntity.storageRoom)
        var modules: [ModuleEntity]

        init(
            rid: UUID,
            name: String,
            cellSizeAmount: Decimal,
            cellSizeUnit: Int,
            gridRows: Int,
            gridCols: Int,
            modules: [ModuleEntity]
        ) {
            self.rid = rid
            self.name = name
            self.cellSizeAmount = cellSizeAmount
            self.cellSizeUnit = cellSizeUnit
            self.gridRows = gridRows
            self.gridCols = gridCols
            self.modules = modules
        }
    }
}
