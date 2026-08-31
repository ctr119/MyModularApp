import StorageDomain
import SwiftUI

struct StorageRoomDetailsView: View {
    let room: StorageRoom
    let targetModule: Module?
    let router: StorageRoomListRouter

    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                StatsView(room: room)
                ModulesCarouselView(
                    modules: room.modules,
                    didTapSeeAll: {
                        router.navigate(to: .modulesList(room.modules))
                    }
                )
                map
            }
            .padding()
        }
        .navigationTitle(room.name)
    }

    private var map: some View {
        StorageMapLayout(room: room) {
            ForEach(room.modules) { module in
                MapModuleView(
                    module: module,
                    isTargeted: module == targetModule
                )
            }
        }
        .background {
            StorageGridBackground(
                rows: room.gridRows,
                cols: room.gridCols,
                backgroundColor: .white,
                cornerRadius: 8
            )
        }
    }
}

#Preview {
    StorageRoomDetailsView(
        room: .mock,
        targetModule: nil,
        router: StorageRoomListRouter()
    )
}
