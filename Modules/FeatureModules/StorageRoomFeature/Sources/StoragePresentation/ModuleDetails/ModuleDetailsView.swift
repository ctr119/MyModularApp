import StorageDomain
import SwiftUI

public struct ModuleDetailsView: View {
    @State private var isAddNewItemTapped = false

    private let module: Module
    private var router: StorageRoomListRouter

    public init(
        module: Module,
        router: StorageRoomListRouter
    ) {
        self.module = module
        self.router = router
    }

    public var body: some View {
        VStack(spacing: 10) {
            ModuleStatsView(module: module)

            if module.items.count <= 0 {
                emptyList
            } else {
                itemsList
            }
        }
        .navigationTitle(module.label)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    isAddNewItemTapped.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $isAddNewItemTapped) {
            router.view(for: .newStoredItem(module))
        }
    }

    private var itemsList: some View {
        List {
            Section {
                ForEach(module.items, id: \.id) {
                    ItemCellView(item: $0)
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
            router: .init(depsContainer: .mock())
        )
    }
}
