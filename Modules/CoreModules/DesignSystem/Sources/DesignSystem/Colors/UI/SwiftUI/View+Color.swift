import Foundation
import SwiftUI

public extension View {
    func color(_ color: DesignSystem.Color?) -> some View {
        modifier(BackgroundColorModifier(color: color))
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
