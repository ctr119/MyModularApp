import StorageDomain
import SwiftUI

struct ModuleDetailsView: View {
    let module: Module

    var body: some View {
        VStack(spacing: 10) {
            ModuleStatsView(module: module)

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
        .navigationTitle(module.label)
    }
}

#Preview {
    ModuleDetailsView(
        module: StorageRoom.mock.modules.first!
    )
}
