import Foundation
import Playgrounds

public struct Measure: CustomStringConvertible, Sendable {
    public let amount: Decimal
    public let unit: Unit

    public var description: String {
        "\(amount) \(unit)"
    }

    public func convert(to newUnit: Unit) -> Measure {
        let diff = unit.decimalScaleDifference(to: newUnit)
        let factor = pow(10, abs(diff))

        let newAmount = if diff > 0 {
            amount * factor
        } else {
            amount / abs(factor)
        }

        return Measure(amount: newAmount, unit: newUnit)
    }
}

// MARK: - Operators

public extension Measure {
    static func +(_ lhs: Measure, _ rhs: Measure) -> Measure {
        var lhsCopy = lhs
        var rhsCopy = rhs

        if lhsCopy.unit < rhsCopy.unit {
            rhsCopy = rhsCopy.convert(to: lhsCopy.unit)
        } else if lhsCopy.unit > rhsCopy.unit {
            lhsCopy = lhsCopy.convert(to: rhsCopy.unit)
        }

        return Measure(
            amount: lhsCopy.amount + rhsCopy.amount,
            unit: lhsCopy.unit
        )
    }

    static func -(_ lhs: Measure, _ rhs: Measure) -> Measure {
        var lhsCopy = lhs
        var rhsCopy = rhs

        if lhsCopy.unit < rhsCopy.unit {
            rhsCopy = rhsCopy.convert(to: lhsCopy.unit)
        } else if lhsCopy.unit > rhsCopy.unit {
            lhsCopy = lhsCopy.convert(to: rhsCopy.unit)
        }

        return Measure(
            amount: lhsCopy.amount - rhsCopy.amount,
            unit: lhsCopy.unit
        )
    }
}
