import DesignSystem
import StorageDomain
import SwiftUI

public struct StorageRoomListView: View {
    @State private var viewModel: StorageRoomListViewModel
    @State private var router: StorageRoomListRouter
    @State private var isNewRoomScreenPresented = false

    public init(
        dependencies container: StorageRoomDependenciesContainer
    ) {
        self._viewModel = State(
            wrappedValue: StorageRoomListViewModel(
                dependencies: container.roomListDependencies
            )
        )

        self._router = State(
            wrappedValue: StorageRoomListRouter(
                depsContainer: container
            )
        )
    }

    public var body: some View {
        NavigationStack(path: $router.path) {
            ScrollView(showsIndicators: false) {
                LazyVGrid(
                    columns: [.init(spacing: 15), .init()],
                    spacing: 15,
                    content: {
                        ForEach(viewModel.rooms) { room in
                            StorageRoomListCellView(room: room)
                                .onTapGesture {
                                    router.navigate(to: .roomDetails(room: room, targetModule: nil))
                                }
                        }
                    }
                )
                .padding()
            }
            .navigationDestination(for: StorageRoomListRouter.Destination.self, destination: { destination in
                router.view(for: destination)
            })
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        isNewRoomScreenPresented.toggle()
                    } label: {
                        Image(systemName: "plus.app")
                    }
                    .tint(color: .accent(.secondary))
                }
            }
            .sheet(
                isPresented: $isNewRoomScreenPresented,
                content: {
                    router.view(for: .newStorageRoom)
                }
            )
            .task {
                await viewModel.loadRooms()
            }
        }
    }
}

#Preview {
    ThemedPreview(theme: .light) {
        StorageRoomListView(
            dependencies: .mock()
        )
    }
}
