import StorageDomain
import SwiftUI

struct StorageRoomListView: View {
    @State private var viewModel: StorageRoomListViewModel

    init(dependencies: StorageRoomListDependencies) {
        self._viewModel = State(
            wrappedValue: StorageRoomListViewModel(dependencies: dependencies)
        )
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(
                columns: [.init(spacing: 15), .init()],
                spacing: 15,
                content: {
                    ForEach(viewModel.rooms) { room in
                        StorageRoomListCellView(room: room)
                    }
                }
            )
            .padding()
        }
        .task {
            await viewModel.loadRooms()
        }
    }
}

#Preview {
    StorageRoomListView(
        dependencies: .init(
            getStorageRoomsUseCase: GetStorageRoomsUseCaseMock()
        )
    )
}
