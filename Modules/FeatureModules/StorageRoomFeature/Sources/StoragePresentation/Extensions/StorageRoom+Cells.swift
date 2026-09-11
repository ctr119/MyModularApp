import Foundation
import StorageDomain

extension StorageRoom {
    /// How many grid cells a real world measure spans in this room
    func cellUnits(for measure: Measure) -> CGFloat {
        let normalized = measure.convert(to: cellSize.unit)
        return (normalized.amount / cellSize.amount).toDouble
    }
}
