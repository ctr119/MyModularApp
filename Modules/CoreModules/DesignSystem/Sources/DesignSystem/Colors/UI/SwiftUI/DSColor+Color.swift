import Foundation
import SwiftUI

public extension DesignSystem.Color {
    func color(for theme: DesignSystem.Theme) -> Color {
        let colorHex = theme.color(self)
        return Color(hexString: colorHex)
    }
}
