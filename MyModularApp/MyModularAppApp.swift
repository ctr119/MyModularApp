import AuthFeature
import NetworkKit
import SwiftUI

@main
struct MyModularAppApp: App {
    @State private var setupTaskId = UUID()
    private let refresher = AuthTokenRefresher()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .task(id: setupTaskId) {
                    // TODO: Move this to AppDelegate / SceneDelegate
                    await TokenProvider.shared
                        .configure(refresher: refresher)
                }
        }
    }
}
