import AuthFeature
import HomeFeature
import NetworkKit
import SwiftUI

@main
struct MyModularAppApp: App {
    @State private var setupTaskId = UUID()
    private let refresher = AuthTokenRefresher()

    var body: some Scene {
        WindowGroup {
            HomeViewBuilder.build()
                .task(id: setupTaskId) {
                    // TODO: Move this to AppDelegate / SceneDelegate
                    await NetworkTokenStoreFactory.make()
                        .setRefreshDelegate(refresher)
                }
        }
    }
}
