import SwiftUI

extension DesignSystem.Theme {
    var colorScheme: ColorScheme {
        switch self {
        case .light: .light
        case .dark: .dark
        default: .light
        }
    }
}
