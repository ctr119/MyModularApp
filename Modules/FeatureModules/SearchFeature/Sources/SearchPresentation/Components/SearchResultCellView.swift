import SearchDomain
import SwiftUI

struct SearchResultCellView: View {
    let searchItem: SearchItem

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            headline.font(.title2)

            pathView()
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .contentShape(Rectangle())
    }

    @ViewBuilder
    private var headline: some View {
        if let item = searchItem.item {
            let iconName = if let initialLetter = item.name.first {
                String(initialLetter) + ".circle.fill"
            } else {
                "arrow.right.circle.fill"
            }

            pathElement(
                title: item.name,
                iconName: iconName.lowercased(),
                iconColor: .orange
            )
        } else {
            pathElement(
                title: searchItem.module.name,
                iconName: "shippingbox.fill",
                iconColor: .brown
            )
        }
    }

    private func pathView() -> some View {
        HStack(spacing: 10) {
            pathElement(
                title: searchItem.room.name,
                iconName: "square.split.bottomrightquarter.fill",
                iconColor: .teal
            )

            if searchItem.item != nil {
                Image(systemName: "play.fill")
                    .foregroundStyle(.black.opacity(0.7))

                pathElement(
                    title: searchItem.module.name,
                    iconName: "shippingbox.fill",
                    iconColor: .brown
                )
            }
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
    VStack(spacing: 40) {
        SearchResultCellView(searchItem: .mock)
        SearchResultCellView(searchItem: .mock2)
    }
}
