import Foundation
import SwiftUI

public extension TextField {
    func dsTextFieldStyle(
        _ style: DesignSystem.TextField,
        color: DesignSystem.Color = .text(.primary),
        weight: DesignSystem.Text.Font.Weight? = nil,
        options: DesignSystem.TextField.Options = .defaultOptions
    ) -> some View {
        self.textFieldStyle(
            DSTextFieldStyle(
                color: color,
                textFieldStyle: style,
                weight: weight,
                options: options
            )
        )
    }
}

private struct DSTextFieldStyle: @preconcurrency TextFieldStyle, Sendable {
    @Environment(\.theme) var theme
    @Environment(\.isFocused) var isFocused
    
    private let defaultUnderlineOffset: CGFloat = 10
    
    let color: DesignSystem.Color
    let textFieldStyle: DesignSystem.TextField
    let weight: DesignSystem.Text.Font.Weight?
    let options: DesignSystem.TextField.Options
    
    private let defaultColor = DesignSystem.Color.text(.primary)
    
    @MainActor
    func _body(configuration: TextField<_Label>) -> some View {
        let textFieldConfig = textFieldStyle.configuration()
        let decorationColor = textFieldConfig.applyColorToDecorations ? color : defaultColor
        
        return addIcon(to: configuration, decorationColor: decorationColor)
            .background(options.isUnderlineVisible ?
                GeometryReader { geometry in
                    Rectangle()
                        .frame(height: 1)
                        .offset(y: (geometry.size.height + defaultUnderlineOffset))
                        .foregroundStyle(decorationColor.color(for: theme))
                } : nil
            )
            .padding(.vertical, options.isUnderlineVisible ? 12.5 : 0)
            .tint(color.color(for: theme))
            .dsTextStyle(
                textFieldConfig.textStyle,
                color: color,
                weight: weight
            )
    }
    
    private func addIcon(
        to configuration: TextField<_Label>,
        decorationColor: DesignSystem.Color
    ) -> some View {
        HStack {
            configuration
            Image(systemName: options.iconName)
                .foregroundStyle(
                    options.isIconVisible ? decorationColor.color(for: theme) : .clear
                )
        }
    }
}

#if DEBUG
#Preview("DS Text Field") {
    DesignSystem.initialize()
    
    return ZStack {
        DesignSystem.Color.surface(.primary)
            .color(for: .light)
            .ignoresSafeArea()
        
        VStack(spacing: 30) {
            TextField("First name", text: .constant("Anonymous"))
                .dsTextFieldStyle(
                    .display,
                    color: .text(.secondary),
                    weight: .medium
                )
            
            TextField("First name", text: .constant("Anonymous Anonymous Anonymous "))
                .dsTextFieldStyle(
                    .display,
                    options: .init(iconName: "arrow.right")
                )
            
            TextField("Second name", text: .constant(""))
                .dsTextFieldStyle(.display)
        }
        .padding()
    }
}
#endif
