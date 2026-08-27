import Foundation
import Playgrounds

public extension Measure {
    enum Unit: Int, Sendable {
        case cm = 0
        case dm
        case m

        func decimalScaleDifference(to otherUnit: Unit) -> Int {
            self.rawValue - otherUnit.rawValue
        }
    }
}

// MARK: - Operators

public extension Measure.Unit {
    static func <(_ lhs: Measure.Unit, _ rhs: Measure.Unit) -> Bool {
        lhs.rawValue < rhs.rawValue
    }

    static func >(_ lhs: Measure.Unit, _ rhs: Measure.Unit) -> Bool {
        lhs.rawValue > rhs.rawValue
    }
}
