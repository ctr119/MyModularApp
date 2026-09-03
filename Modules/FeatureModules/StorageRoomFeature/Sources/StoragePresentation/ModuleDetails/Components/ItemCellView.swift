import StorageDomain
import SwiftUI

struct ItemCellView: View {
    let item: StoredItem

    var body: some View {
        VStack(alignment: .leading) {
            Text(item.name)
                .font(.headline.monospaced())

            FlowLayout(spacing: 10) {
                ForEach(item.tags, id: \.self) {
                    Text("#\($0)")
                        .font(.caption.monospaced())
                        .padding(.vertical, 6)
                        .padding(.horizontal, 8)
                        .background(Color.black.opacity(0.1))
                        .clipShape(Capsule())
                }
            }
        }
    }
}

#Preview {
    ItemCellView(
        item: StorageRoom.mock.modules.first!.items.first!
    )
}
