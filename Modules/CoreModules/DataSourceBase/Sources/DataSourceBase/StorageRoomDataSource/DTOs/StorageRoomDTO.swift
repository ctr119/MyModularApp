import Foundation

public struct StorageRoomDTO: Sendable {
    public let id: UUID
    public let name: String
    public let cellSizeAmount: Decimal
    public let cellSizeUnit: Int
    public let gridRows: Int
    public let gridCols: Int

    public let modules: [ModuleDTO]

    public init(
        id: UUID,
        name: String,
        cellSizeAmount: Decimal,
        cellSizeUnit: Int,
        gridRows: Int,
        gridCols: Int,
        modules: [ModuleDTO]
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

extension StorageRoomEntity {
    var toDto: StorageRoomDTO {
        .init(
            id: self.id,
            name: self.name,
            cellSizeAmount: self.cellSizeAmount,
            cellSizeUnit: self.cellSizeUnit,
            gridRows: self.gridRows,
            gridCols: self.gridCols,
            modules: self.modules.map { $0.toDto }
        )
    }
}
