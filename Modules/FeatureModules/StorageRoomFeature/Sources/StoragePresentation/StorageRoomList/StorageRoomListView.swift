import StorageDomain
import SwiftUI

struct StorageRoomListView: View {
    let room: StorageRoom

    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(
                columns: [.init(spacing: 15), .init()],
                spacing: 15,
                content: {
                    StorageRoomListCellView(room: room)
                    StorageRoomListCellView(room: room)
                    StorageRoomListCellView(room: room)
                    StorageRoomListCellView(room: room)
                }
            )
            .padding()
        }
    }
}

#Preview {
    StorageRoomListView(room: .mock)
}
