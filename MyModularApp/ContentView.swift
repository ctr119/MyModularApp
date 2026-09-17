import DataSourceBase
import StorageRoomFeature
import SearchFeature
import SearchPresentation
import SwiftUI
import SwiftData
import DesignSystem

struct ContentView: View {
    @Environment(\.storageRoomContainer) var storageRoomContainer
    @State private var searchText = ""

    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                Text("Hello World")
                    .dsTextStyle(.display)
            }

            Tab(
                "Rooms",
                systemImage: "square.split.bottomrightquarter"
            ) {
                StorageRoomFactory.make(
                    container: storageRoomContainer
                )
            }

            Tab(role: .search) {
                SearchFeatureFactory.make(
                    searchText: $searchText,
                    container: storageRoomContainer) { event in
                        appRoutes(event)
                    }
                    .searchable(
                        text: $searchText,
                        prompt: "Search items"
                    )
            }
        }
        .tabViewSearchActivation(.searchTabSelection)
    }

    @ViewBuilder
    private func appRoutes(_ event: SearchNavigationEvent) -> some View {
        let id = if case let .resultTapped(id) = event {
            "\(id)"
        } else { "n/a" }
        Text(id)
    }
}

#Preview {
    let previewContainer = StorageRoomDatabase.getContainer(forPreviews: true)

    return ContentView()
        .environment(\.storageRoomContainer, previewContainer)
}
