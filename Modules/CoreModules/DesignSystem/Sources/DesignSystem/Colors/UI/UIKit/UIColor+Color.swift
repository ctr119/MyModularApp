import Foundation
import UIKit

public extension DesignSystem.Color {
    func color(for theme: DesignSystem.Theme) -> UIColor {
        let colorHex = theme.color(self)
        return UIColor(hexString: colorHex)
    }
}
