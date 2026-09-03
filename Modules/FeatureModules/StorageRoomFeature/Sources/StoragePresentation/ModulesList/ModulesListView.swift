import StorageDomain
import SwiftUI

struct ModulesListView: View {
    let modules: [Module]
    var router: StorageRoomListRouter

    var body: some View {
        List(modules) { module in
            ModuleCellView(
                module: module,
                didTapModule: {
                    router.navigate(
                        to: .moduleDetails(module)
                    )
                },
                didTapLocateButton: {
                    router.back(returning: module)
                }
            )
        }
        .navigationTitle("All modules")
    }
}

#Preview {
    ModulesListView(
        modules: StorageRoom.mock.modules,
        router: StorageRoomListRouter()
    )
}
