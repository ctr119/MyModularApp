import Foundation
import SwiftUI

@MainActor
public extension Button {
    func dsButtonStyle(
        _ style: DesignSystem.Button,
        contentMode: DesignSystem.Button.ContentMode = .fit
    ) -> some View {
        self.buttonStyle(
            DesignSystemButtonStyle(
                style: style,
                contentMode: contentMode
            )
        )
    }
}

private struct DesignSystemButtonStyle: ButtonStyle {
    @Environment(\.theme) var theme
    @Environment(\.isEnabled) var isEnabled
    
    let style: DesignSystem.Button
    let contentMode: DesignSystem.Button.ContentMode
    
    func makeBody(configuration: Configuration) -> some View {
        let buttonConfiguration = style.config()
        let opacity: Double = isEnabled ? (configuration.isPressed ? 0.7 : 1) : 0.6
        let border = buttonConfiguration.border
        let foregroundColor = buttonConfiguration.foregroundColor.forEnabledState(isEnabled)
        let backgroundColor = buttonConfiguration.backgroundColor.forEnabledState(isEnabled)
        
        return configuration.label
            .dsTextStyle(
                buttonConfiguration.textStyle,
                color: foregroundColor,
                opacity: opacity
            )
            .padding(.vertical, buttonConfiguration.insets.vertical)
            .padding(.horizontal, buttonConfiguration.insets.horizontal)
            .frame(maxWidth: contentMode == .fit ? nil : .infinity)
            .background(
                backgroundColor.color(for: theme).opacity(opacity)
            )
            .clipShape(
                RoundedRectangle(cornerRadius: buttonConfiguration.cornerRadius)
            )
            .overlay {
                if let border {
                    let borderColor = border.color.forEnabledState(isEnabled)
                    
                    RoundedRectangle(cornerRadius: buttonConfiguration.cornerRadius)
                        .stroke(
                            borderColor.color(for: theme).opacity(opacity),
                            lineWidth: border.width
                        )
                }
            }
    }
}

#if DEBUG
#Preview("Button Styles") {
    DesignSystem.initialize()
    
    return ZStack {
        VStack(spacing: 20) {
            // MARK: - Enabled
            
            Button(action: {}, label: {
                Text("Primary - Enabled")
            })
            .dsButtonStyle(.primary)
            
            Button(action: {}, label: {
                Text("Primary - Enabled")
            })
            .dsButtonStyle(.primary, contentMode: .fill)
            
            // MARK: - Disabled
            
            Button(action: {}, label: {
                Text("Primary - Disabled")
            })
            .dsButtonStyle(.primary)
            .disabled(true)
            
            Button(action: {}, label: {
                Text("Primary - Disabled")
            })
            .dsButtonStyle(.primary, contentMode: .fill)
            .disabled(true)
        }
        .padding()
    }
}
#endif
