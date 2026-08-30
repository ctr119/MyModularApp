import AuthFeature
import DataSourceBase
import HomeFeature
import NetworkKit
import SwiftData
import SwiftUI

@main
struct MyModularAppApp: App {
    @State private var setupTaskId = UUID()
    private let refresher = AuthTokenRefresher()

    private var storageRoomModelContainer: ModelContainer = {
        StorageRoomDatabase.getContainer()
    }()

    var body: some Scene {
        WindowGroup {
            HomeViewBuilder.build()
                .task(id: setupTaskId) {
                    // TODO: Move this to AppDelegate / SceneDelegate
                    await NetworkTokenStoreFactory.make()
                        .setRefreshDelegate(refresher)
                }
                .environment(\.storageRoomContainer, storageRoomModelContainer)
        }
    }
}
