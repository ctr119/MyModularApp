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
