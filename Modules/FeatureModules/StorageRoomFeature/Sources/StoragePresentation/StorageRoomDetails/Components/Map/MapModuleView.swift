import DesignSystem
import StorageDomain
import SwiftUI

struct MapModuleView: View {
    @Environment(\.theme) var theme

    let module: Module
    let isTargeted: Bool

    private var backgroundColor: Color {
        let token: DesignSystem.Color = .brand(.secondary)
        return token.color(for: theme)
    }

    private var targetColor: Color {
        let token: DesignSystem.Color = .feedback(.error)
        return token.color(for: theme)
    }

    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(backgroundColor)
            .overlay {
                Text(module.label)
                    .dsTextStyle(.caption)
            }
            .overlay {
                // TODO: Change the stroke by a pulsed red dot animation
                if isTargeted {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(targetColor, lineWidth: 4)
                        .transition(.opacity)
                }
            }
    }
}

#Preview {
    ThemedPreview(theme: .light) {
        MapModuleView(
            module: .init(
                id: UUID(),
                label: "Kitchen",
                realWidth: .init(amount: 50, unit: .cm),
                realDepth: .init(amount: 30, unit: .cm),
                position: .init(x: 0, y: 0),
                items: []
            ),
            isTargeted: true
        )
    }
}
