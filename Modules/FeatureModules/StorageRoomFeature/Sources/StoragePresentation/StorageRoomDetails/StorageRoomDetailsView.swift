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
                    targetModule: targetModule,
                    didTapModule: { module in
                        router.navigate(to: .moduleDetails(module))
                    },
                    didTapSeeAll: {
                        router.navigate(to: .modulesList(room.modules))
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
