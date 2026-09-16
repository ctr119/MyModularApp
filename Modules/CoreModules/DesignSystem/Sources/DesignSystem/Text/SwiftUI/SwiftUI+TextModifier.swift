import SwiftUI

public extension View {
    func dsTextStyle(
        _ style: DesignSystem.Text,
        color: DesignSystem.Color = .text(.primary),
        opacity: Double = 1.0,
        weight: DesignSystem.Text.Font.Weight? = nil
    ) -> some View {
        modifier(
            TextModifier(
                style: style,
                color: color,
                opacity: opacity,
                overridingWeight: weight
            )
        )
    }
}

private struct TextModifier: ViewModifier {
    @Environment(\.theme) private var theme: DesignSystem.Theme
    
    let style: DesignSystem.Text
    let color: DesignSystem.Color
    let opacity: Double
    let overridingWeight: DesignSystem.Text.Font.Weight?
    
    func body(content: Content) -> some View {
        let configuration = style.configuration()
        
        return content
            .font(
                .custom(
                    configuration.font.name(overridingWeight),
                    size: configuration.size
                )
            )
            .textCase(configuration.isUppercase ? .uppercase : nil)
            .foregroundStyle(
                color.color(for: theme).opacity(opacity)
            )
    }
}

#if DEBUG
#Preview {
    DesignSystem.initialize()
    
    return ZStack {
        VStack(alignment: .leading, spacing: 20) {
            Text("Display L")
                .dsTextStyle(.displayLarge)
            
            Text("Display M")
                .dsTextStyle(.displayMedium)
            
            Text("Headline L")
                .dsTextStyle(.headlineLarge)
            
            Text("Headline M")
                .dsTextStyle(.headlineMedium)
            
            Text("Headline S")
                .dsTextStyle(.headlineSmall)
            
            Text("Title L")
                .dsTextStyle(.titleLarge)
            
            Text("Title M")
                .dsTextStyle(.titleMedium)
            
            Text("Title S")
                .dsTextStyle(.titleSmall)
            
            Text("Body L")
                .dsTextStyle(.bodyLarge)
            
            Text("Body M")
                .dsTextStyle(.bodyMedium)
            
            Text("Body S")
                .dsTextStyle(.bodySmall)
            
            Text("Label L")
                .dsTextStyle(.labelLarge)
            
            Text("Label M")
                .dsTextStyle(.labelMedium)
            
            Text("Label S")
                .dsTextStyle(.labelSmall)
        }
    }
}
#endif
