import Foundation
import SwiftUI

struct AlertTileView: View {
    @Environment(\.theme) var theme
    
    private let alert: AlertItem
    private let configuration: DesignSystem.Alert.Configuration
    private let dismissTile: () -> Void
    
    init(alert: AlertItem, dismissTile: @escaping () -> Void) {
        self.alert = alert
        self.configuration = alert.style.config()
        self.dismissTile = dismissTile
    }
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: configuration.icon.name)
                .font(.system(size: 20))
                .foregroundStyle(
                    configuration.icon.color.color(for: theme)
                )
            Text(alert.message)
                .lineLimit(3)
            
            Spacer()
            
            if let action = alert.action {
                Button {
                    action.action?()
                    dismissTile()
                } label: {
                    Image(systemName: action.type.iconName)
                        .font(.system(size: 16))
                }
            }
        }
        .dsTextStyle(
            configuration.textStyle,
            color: configuration.foregroundColor
        )
        .padding(20)
        .background(color: configuration.backgroundColor)
        .clipShape(
            RoundedRectangle(cornerRadius: configuration.cornerRadius)
        )
        .overlay {
            RoundedRectangle(cornerRadius: configuration.cornerRadius)
                .stroke(
                    configuration.stroke.color.color(for: theme),
                    lineWidth: configuration.stroke.width
                )
        }
        .padding(.horizontal)
    }
}

#if DEBUG
#Preview {
    ThemedPreview(
        theme: .dark,
        content: {
            VStack {
                AlertTileView(
                    alert: .info(
                        message: "Only for your information",
                        action: .dismiss()
                    ),
                    dismissTile: {}
                )
                AlertTileView(
                    alert: .warning(
                        message: "Something happened, but we're fine",
                        action: .retry({})
                    ),
                    dismissTile: {}
                )
                AlertTileView(
                    alert: .error(
                        message: "Oh... It's better to report this",
                        action: .report({})
                    ),
                    dismissTile: {}
                )
            }
        }
    )
}
#endif
