import DataSourceBase
import Foundation
import StorageDomain

extension ModuleDTO {
    var toDomain: Module? {
        guard let realWidthUnit = Measure.Unit(rawValue: self.realWidthUnit),
              let realDepthUnit = Measure.Unit(rawValue: self.realDepthUnit) else {
            return nil
        }
        let realWidth = Measure(amount: self.realWidthAmount, unit: realWidthUnit)
        let realDepth = Measure(amount: self.realDepthAmount, unit: realDepthUnit)

        let position = Module.Position(x: self.positionX, y: self.positionY)

        return .init(
            id: self.id,
            label: self.label,
            realWidth: realWidth,
            realDepth: realDepth,
            position: position,
            items: self.items.map { $0.toDomain }
        )
    }
}
