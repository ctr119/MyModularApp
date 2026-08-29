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

    init(
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

public extension StorageRoom {
    static var mock: StorageRoom {
        .init(
            id: UUID(),
            name: "Storage Room 112",
            cellSize: .init(amount: 1, unit: .m),
            gridRows: 6,
            gridCols: 4,
            modules: [
                .init(
                    id: UUID(),
                    label: "1",
                    realWidth: .init(amount: 50, unit: .cm),
                    realDepth: .init(amount: 30, unit: .cm),
                    position: .init(x: 0, y: 0),
                    items: []
                ),
                .init(
                    id: UUID(),
                    label: "2",
                    realWidth: .init(amount: 20, unit: .cm),
                    realDepth: .init(amount: 30, unit: .cm),
                    position: .init(x: 0, y: 40),
                    items: []
                ),
            ]
        )
    }
}
