import Foundation
import StorageDomain

struct MeasureModel {
    var amount: Decimal = 50
    var unit: Measure.Unit = .cm
}

extension MeasureModel {
    var toDomain: Measure {
        .init(amount: amount, unit: unit)
    }
}
