import DataSourceBase
import Foundation
import StorageDomain

extension StorageRoomDTO {
    var toDomain: StorageRoom? {
        guard let cellSizeUnit = Measure.Unit(rawValue: self.cellSizeUnit) else {
            return nil
        }

        let cellSize = Measure(amount: self.cellSizeAmount, unit: cellSizeUnit)

        return .init(
            id: self.id,
            name: self.name,
            cellSize: cellSize,
            gridRows: self.gridRows,
            gridCols: self.gridCols,
            modules: self.modules.compactMap { $0.toDomain }
        )
    }
}

extension StorageRoom {
    var toDto: StorageRoomDTO {
        .init(
            id: self.id,
            name: self.name,
            cellSizeAmount: self.cellSize.amount,
            cellSizeUnit: self.cellSize.unit.rawValue,
            gridRows: self.gridRows,
            gridCols: self.gridCols,
            modules: self.modules.map { $0.toDto }
        )
    }
}
