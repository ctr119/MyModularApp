import StorageDomain
import SwiftUI

struct ModuleDetailsView: View {
    let module: Module

    var body: some View {
        VStack(spacing: 10) {
            ModuleStatsView(module: module)

            if module.items.count <= 0 {
                emptyList
            } else {
                itemsList
            }
        }
        .navigationTitle(module.label)
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
    ModuleDetailsView(
        module: StorageRoom.mock.modules.first!
    )
}
