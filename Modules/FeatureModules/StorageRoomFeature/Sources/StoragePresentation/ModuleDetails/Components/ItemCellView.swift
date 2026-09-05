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
                    ItemTagView(tag: $0)
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
