import Foundation

public struct StorageRoom: Identifiable, Sendable {
    public let id: UUID
    public let name: String
    public let cellSize: Measure
    public let gridRows: Int
    public let gridCols: Int
    public let modules: [Module]

    public var realWidth: Measure {
        Measure(
            amount: Decimal(gridCols) * cellSize.amount,
            unit: cellSize.unit
        )
    }
    public var realDepth: Measure {
        Measure(
            amount: Decimal(gridRows) * cellSize.amount,
            unit: cellSize.unit
        )
    }

    public init(
        id: UUID,
        name: String,
        cellSize: Measure,
        gridRows: Int,
        gridCols: Int,
        modules: [Module]
    ) {
        self.id = id
        self.name = name
        self.cellSize = cellSize
        self.gridRows = gridRows
        self.gridCols = gridCols
        self.modules = modules
    }
}


