import Foundation
import SwiftUI

public extension DesignSystem.Button {
    static var primary: DesignSystem.Button {
        .init {
            .init(
                textStyle: .bodyLarge,
                backgroundColor: .init(
                    enabled: .button(.primary),
                    disabled: .button(.primary)
                ),
                foregroundColor: .init(
                    enabled: .text(.tertiary),
                    disabled: .text(.secondary)
                ),
                cornerRadius: 30,
                border: nil
            )
        }
    }
}

#if DEBUG
#Preview("Ligth Mode") {
    ThemedPreview(theme: .light) {
        VStack(spacing: 20) {
            Button(action: {}, label: {
                Text("Enabled")
            })
            .dsButtonStyle(.primary)
            
            Button(action: {}, label: {
                Text("Disabled")
            })
            .dsButtonStyle(.primary)
            .disabled(true)
        }
        .padding()
    }
}

#Preview("Dark Mode") {
    ThemedPreview(theme: .dark) {
        VStack(spacing: 20) {
            Button(action: {}, label: {
                Text("Enabled")
            })
            .dsButtonStyle(.primary)
            
            Button(action: {}, label: {
                Text("Disabled")
            })
            .dsButtonStyle(.primary)
            .disabled(true)
        }
        .padding()
    }
}
#endif
