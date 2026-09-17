import Foundation
import SwiftUI

public extension View {
    func background(color: DesignSystem.Color?) -> some View {
        modifier(BackgroundColorModifier(color: color))
    }

    func foreground(color: DesignSystem.Color?) -> some View {
        modifier(ForegroundColorModifier(color: color))
    }

    func tint(color: DesignSystem.Color?) -> some View {
        modifier(TintColorModifier(color: color))
    }
}

private struct BackgroundColorModifier: ViewModifier {
    @Environment(\.theme) var theme
    
    let color: DesignSystem.Color?
    
    func body(content: Content) -> some View {
        content
            .background(color?.color(for: theme) ?? .clear)
    }
}

private struct ForegroundColorModifier: ViewModifier {
    @Environment(\.theme) var theme

    let color: DesignSystem.Color?

    func body(content: Content) -> some View {
        content
            .foregroundStyle(color?.color(for: theme) ?? .clear)
    }
}

private struct TintColorModifier: ViewModifier {
    @Environment(\.theme) var theme

    let color: DesignSystem.Color?

    func body(content: Content) -> some View {
        content
            .tint(color?.color(for: theme) ?? .clear)
    }
}
