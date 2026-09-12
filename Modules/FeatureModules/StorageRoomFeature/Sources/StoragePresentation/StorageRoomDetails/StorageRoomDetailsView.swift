import StorageDomain
import SwiftUI

public struct StorageRoomDetailsView: View {
    @State private var isNewModuleViewPresented = false
    @State private var viewModel: StorageRoomDetailsViewModel

    private let targetModule: Module?
    private let router: StorageRoomListRouter

    public init(
        room: StorageRoom,
        targetModule: Module?,
        router: StorageRoomListRouter,
        dependencies: StorageRoomDetailsDependencies
    ) {
        self._viewModel = State(
            wrappedValue: StorageRoomDetailsViewModel(
                dependencies: dependencies,
                room: room
            )
        )
        self.targetModule = targetModule
        self.router = router
    }

    public var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                StatsView(room: viewModel.room)

                ModulesCarouselView(
                    modules: viewModel.room.modules,
                    targetModule: targetModule,
                    didTapModule: { module in
                        router.navigate(to: .moduleDetails(module))
                    },
                    didTapSeeAll: {
                        router.navigate(
                            to: .modulesList(viewModel.room.modules)
                        )
                    }
                )
                .contentMargins(
                    .horizontal,
                    .init(exactly: 14),
                    for: .scrollContent
                )

                map
                    .padding(.horizontal)
            }
            .padding(.vertical)
        }
        .navigationTitle(viewModel.room.name)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    isNewModuleViewPresented.toggle()
                } label: {
                    Image(systemName: "widget.small.badge.plus")
                }
            }
        }
        .sheet(
            isPresented: $isNewModuleViewPresented,
            onDismiss: {
                Task { @MainActor in
                    await viewModel.refreshDetails()
                }
            },
            content: {
                router.view(
                    for: .newModule(viewModel.room)
                )
            }
        )
        .task {
            await viewModel.refreshDetails()
        }
    }

    private var map: some View {
        StorageMapLayout(room: viewModel.room) {
            ForEach(viewModel.room.modules) { module in
                MapModuleView(
                    module: module,
                    isTargeted: module == targetModule
                )
            }
        }
        .background {
            StorageGridBackground(
                rows: viewModel.room.gridRows,
                cols: viewModel.room.gridCols,
                backgroundColor: .white,
                cornerRadius: 8
            )
        }
    }
}

#Preview {
    NavigationStack {
        StorageRoomDetailsView(
            room: .mock,
            targetModule: nil,
            router: StorageRoomListRouter(
                depsContainer: .mock()
            ),
            dependencies: .mock()
        )
    }
}
