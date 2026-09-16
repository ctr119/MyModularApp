import Foundation

public extension DesignSystem {
    struct Button {
        public enum ContentMode {
            case fill
            case fit
        }
        
        struct Configuration {
            struct Color {
                let enabled: DesignSystem.Color
                let disabled: DesignSystem.Color
                
                func forEnabledState(_ isEnabled: Bool) -> DesignSystem.Color {
                    isEnabled ? enabled : disabled
                }
            }
            
            struct Border {
                let width: CGFloat
                let color: Color
            }
            
            struct Insets {
                let horizontal: CGFloat
                let vertical: CGFloat
            }
            
            let textStyle: DesignSystem.Text
            let backgroundColor: Color
            let foregroundColor: Color
            let cornerRadius: CGFloat
            let border: Border?
            let insets: Insets
            
            init(
                textStyle: DesignSystem.Text,
                backgroundColor: Color,
                foregroundColor: Color,
                cornerRadius: CGFloat,
                border: Border? = nil,
                insets: Insets = .init(horizontal: 30, vertical: 15)
            ) {
                self.textStyle = textStyle
                self.backgroundColor = backgroundColor
                self.foregroundColor = foregroundColor
                self.cornerRadius = cornerRadius
                self.border = border
                self.insets = insets
            }
        }
        
        let config: () -> Configuration
    }
}
