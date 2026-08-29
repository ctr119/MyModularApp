import SwiftUI

struct SearchResultCellView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Spoons")
                .font(.title2)

            pathView()
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .contentShape(Rectangle())
    }

    private func pathView() -> some View {
        HStack(spacing: 10) {
            pathElement(
                title: "Storage 1",
                iconName: "square.split.bottomrightquarter.fill",
                iconColor: .teal
            )

            Image(systemName: "play.fill")
                .foregroundStyle(.black.opacity(0.7))

            pathElement(
                title: "Box 1: Kitchen",
                iconName: "shippingbox.fill",
                iconColor: .brown
            )
        }
        .font(.caption.monospaced())
    }

    private func pathElement(
        title: String,
        iconName: String,
        iconColor: Color
    ) -> some View {
        HStack(spacing: 4) {
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
            Text(title)
        }
    }
}

#Preview {
    SearchResultCellView()
}
