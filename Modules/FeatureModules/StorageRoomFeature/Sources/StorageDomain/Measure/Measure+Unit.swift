import Foundation
import Playgrounds

public extension Measure {
    enum Unit: Int, CaseIterable, Sendable {
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

// MARK: - Conformance

extension Measure.Unit: CustomLocalizedStringResourceConvertible {
    public var localizedStringResource: LocalizedStringResource {
        switch self {
        case .cm: "cm"
        case .dm: "dm"
        case .m: "m"
        }
    }
}
