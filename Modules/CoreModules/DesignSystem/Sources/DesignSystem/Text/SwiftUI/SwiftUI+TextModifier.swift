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
            Text("Display")
                .dsTextStyle(.display)
            
            Text("Title L")
                .dsTextStyle(.titleLarge)
            
            Text("Title M")
                .dsTextStyle(.titleMedium)

            Text("SubTitle")
                .dsTextStyle(.subTitle)

            Text("Body L")
                .dsTextStyle(.bodyLarge)
            
            Text("Body M")
                .dsTextStyle(.bodyMedium)
            
            Text("Body S")
                .dsTextStyle(.bodySmall)

            Text("Caption")
                .dsTextStyle(.caption)

            Text("Label")
                .dsTextStyle(.label)
        }
    }
}
#endif
