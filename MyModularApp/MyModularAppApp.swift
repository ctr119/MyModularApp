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
        let schema = StorageRoomDatabase.getSchema()
        let configuration = ModelConfiguration(schema: schema)
        do {
            return try ModelContainer(for: schema, configurations: configuration)
        } catch {
            let errorMessage = "SwiftData couldn't load StorageRoomDatabase. Error: \(error.localizedDescription)"
            fatalError(errorMessage)
        }
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
