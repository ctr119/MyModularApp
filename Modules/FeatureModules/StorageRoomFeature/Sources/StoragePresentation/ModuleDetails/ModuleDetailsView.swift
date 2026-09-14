import StorageDomain
import SwiftUI

public struct ModuleDetailsView: View {
    @State private var isAddNewItemTapped = false
    @State private var isDeleteModuleTapped = false
    @State private var itemToDelete: StoredItem?
    @State private var viewModel: ModuleDetailsViewModel
    private var router: StorageRoomListRouter

    public init(
        module: Module,
        router: StorageRoomListRouter,
        dependencies: ModuleDetailsDependencies
    ) {
        self._viewModel = State(
            wrappedValue: ModuleDetailsViewModel(
                module: module,
                dependencies: dependencies
            )
        )
        self.router = router
    }

    public var body: some View {
        VStack(spacing: 10) {
            ModuleStatsView(module: viewModel.module)

            if viewModel.module.items.count <= 0 {
                emptyList
            } else {
                itemsList
                    .animation(
                        .easeInOut,
                        value: viewModel.module.items
                    )
            }
        }
        .navigationTitle(viewModel.module.label)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    isAddNewItemTapped.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }

            ToolbarItem(placement: .destructiveAction) {
                Button {
                    isDeleteModuleTapped.toggle()
                } label: {
                    Image(systemName: "trash")
                }
            }
        }
        .sheet(
            isPresented: $isAddNewItemTapped,
            onDismiss: {
                Task { @MainActor in
                    await viewModel.refreshDetails()
                }
            }
        ) {
            router.view(for: .newStoredItem(viewModel.module))
        }
        .alert(
            "Remove module?",
            isPresented: $isDeleteModuleTapped,
            actions: {
                Button(role: .cancel, action: {})
                Button(role: .destructive, action: {
                    Task { @MainActor in
                        await viewModel.deleteModule()
                        router.back(returning: viewModel.module)
                    }
                })
            },
            message: {
                Text("This action cannot be undone.")
            }
        )
        .alert(
            "Remove item?",
            isPresented: Binding(
                get: { itemToDelete != nil },
                set: { if !$0 { itemToDelete = nil } }
            ),
            presenting: itemToDelete,
            actions: { item in
                Button(role: .cancel, action: {
                    itemToDelete = nil
                })
                Button(role: .destructive, action: {
                    Task { @MainActor in
                        await viewModel.delete(item: item)
                        itemToDelete = nil
                    }
                })
            },
            message: { _ in
                Text("This action cannot be undone.")
            }
        )
    }

    private var itemsList: some View {
        List {
            Section {
                ForEach(viewModel.module.items, id: \.id) { item in
                    ItemCellView(item: item)
                        .swipeActions(
                            edge: .trailing,
                            allowsFullSwipe: false
                        ) {
                            Button {
                                itemToDelete = item
                            } label: {
                                Image(systemName: "trash")
                            }
                            .tint(.red)
                        }
                }
            } header: {
                Text("Items")
                    .monospaced()
            }
            .padding(.top, 10)
        }
    }

    private var emptyList: some View {
        VStack(spacing: 10) {
            Image(systemName: "tray")
                .font(.system(size: 40))

            Text("Empty module")
                .font(.title2.monospaced())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(uiColor: .secondarySystemBackground))
    }
}

#Preview {
    NavigationStack {
        ModuleDetailsView(
            module: StorageRoom.mock.modules.first!,
            router: .init(depsContainer: .mock()),
            dependencies: .mock()
        )
    }
}
