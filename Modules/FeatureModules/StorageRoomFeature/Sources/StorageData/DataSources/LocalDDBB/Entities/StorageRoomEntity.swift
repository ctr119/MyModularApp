import Foundation
import SwiftData

extension StorageRoomSchemaV1 {
    @Model
    public class StorageRoomEntity {
        public var id: UUID
        public var name: String
        public var cellSizeAmount: Decimal
        public var cellSizeUnit: Int
        public var gridRows: Int
        public var gridCols: Int

        @Relationship(inverse: \ModuleEntity.storageRoom)
        public var modules: [ModuleEntity]

        public init(
            id: UUID,
            name: String,
            cellSizeAmount: Decimal,
            cellSizeUnit: Int,
            gridRows: Int,
            gridCols: Int,
            modules: [ModuleEntity]
        ) {
            self.id = id
            self.name = name
            self.cellSizeAmount = cellSizeAmount
            self.cellSizeUnit = cellSizeUnit
            self.gridRows = gridRows
            self.gridCols = gridCols
            self.modules = modules
        }
    }
}
