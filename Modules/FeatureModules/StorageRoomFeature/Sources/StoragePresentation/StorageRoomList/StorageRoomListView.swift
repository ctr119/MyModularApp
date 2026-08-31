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
        NavigationStack(path: $viewModel.router.path) {
            ScrollView(showsIndicators: false) {
                LazyVGrid(
                    columns: [.init(spacing: 15), .init()],
                    spacing: 15,
                    content: {
                        ForEach(viewModel.rooms) { room in
                            StorageRoomListCellView(room: room)
                                .onTapGesture {
                                    viewModel.didTapRoom(room)
                                }
                        }
                    }
                )
                .padding()
            }
            .navigationDestination(for: StorageRoomListRouter.Destination.self, destination: { destination in
                viewModel.router.view(for: destination)
            })
            .task {
                await viewModel.loadRooms()
            }
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
