import Foundation
import SwiftUI

#if DEBUG
struct PalletteView: View {
    let theme: DesignSystem.Theme
    
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: [.init(), .init(), .init()],
                spacing: 30
            ) {
                ForEach(
                    Array(theme.semanticMap.keys).sorted(
                        by: { lhs, rhs in
                            lhs.name < rhs.name
                        }),
                    id: \.self
                ) { key in
                    TokenView(
                        name: "\(key.name)",
                        hex: theme.semanticMap[key]?.rawValue ?? ""
                    )
                }
            }
        }
    }
}

#Preview("Light Theme") {
    PalletteView(theme: .light)
}

#Preview("Dark Theme") {
    PalletteView(theme: .dark)
}
#endif
