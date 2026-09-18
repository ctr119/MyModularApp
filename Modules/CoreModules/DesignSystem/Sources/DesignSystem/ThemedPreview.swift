import SwiftUI

public struct ThemedPreview<Content: View>: View {
    private let theme: DesignSystem.Theme
    private let content: Content
    
    public init(
        theme: DesignSystem.Theme = .light,
        @ViewBuilder content: () -> Content,
    ) {
        DesignSystem.initialize()

        self.theme = theme
        self.content = content()
    }
    
    public var body: some View {
        ZStack {
            DesignSystem.Color.surface(.primary)
                .color(for: theme)
                .ignoresSafeArea()
            
            content
        }
        .setTheme(theme)
    }
}
