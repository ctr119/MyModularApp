import Foundation
import SwiftUI

private struct ThemeKey: EnvironmentKey {
    static var defaultValue: DesignSystem.Theme { .light }
}

public extension EnvironmentValues {
    var theme: DesignSystem.Theme {
        get { self[ThemeKey.self] }
        set { self[ThemeKey.self] = newValue }
    }
}

public extension View {
    func setTheme(_ theme: DesignSystem.Theme) -> some View {
        self
            .environment(\.theme, theme)
            .preferredColorScheme(theme.colorScheme)
    }
}
