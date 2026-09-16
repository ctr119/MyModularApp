#if DEBUG
import SwiftUI

private struct Style {
    let name: String
    let style: DesignSystem.Button
}

struct ButtonsPreviewSet: View {
    @Environment(\.theme) var theme
    
    private let styles: [Style] = [
        .init(name: "Primary", style: .primary),
    ]
    
    var body: some View {
        VStack(spacing: 30) {
            ForEach(0..<styles.count, id: \.self) { index in
                let style = styles[index]
                
                VStack(alignment: .leading) {
                    Text("# " + style.name)
                        .font(
                            .system(size: 14)
                            .smallCaps()
                        )
                        .foregroundStyle(theme == DesignSystem.Theme.dark ? .white : .black)
                    
                    Button(action: {}, label: {
                        Text("Enabled")
                    })
                    .dsButtonStyle(style.style)
                    
                    Button(action: {}, label: {
                        Text("Disabled")
                    })
                    .dsButtonStyle(style.style)
                    .disabled(true)
                }
            }
        }
        .padding()
    }
}

#Preview("Ligth Mode") {
    ThemedPreview(theme: .light) {
        ButtonsPreviewSet()
    }
}

#Preview("Dark Mode") {
    ThemedPreview(theme: .dark) {
        ButtonsPreviewSet()
    }
}
#endif

