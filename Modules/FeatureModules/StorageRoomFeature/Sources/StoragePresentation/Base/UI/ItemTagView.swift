import SwiftUI

struct ItemTagView: View {
    let tag: String

    var body: some View {
        Text("#\(tag)")
            .font(.caption.monospaced())
            .padding(.vertical, 6)
            .padding(.horizontal, 8)
            .background(Color.black.opacity(0.1))
            .clipShape(Capsule())
    }
}

#Preview {
    ItemTagView(tag: "Queso")
}
