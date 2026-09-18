import Foundation
import SwiftUI

public extension View {
    func background(
        color: DesignSystem.Color?,
        opacity: CGFloat = 1.0
    ) -> some View {
        modifier(
            BackgroundColorModifier(
                color: color,
                opacity: opacity
            )
        )
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
    let opacity: CGFloat

    private var resolvedColor: SwiftUI.Color {
        (color?.color(for: theme) ?? .clear)
            .opacity(opacity)
    }

    func body(content: Content) -> some View {
        content
            .background(resolvedColor)
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
