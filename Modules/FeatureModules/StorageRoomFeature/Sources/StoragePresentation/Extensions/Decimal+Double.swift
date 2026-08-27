import Foundation

extension Decimal {
    var toDouble: Double {
        Double(truncating: self as NSNumber) 
    }
}
