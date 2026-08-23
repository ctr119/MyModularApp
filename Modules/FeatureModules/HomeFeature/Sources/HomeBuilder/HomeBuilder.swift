import HomeData
import HomeDomain
import HomeUI
import NetworkKit
import SwiftUI

@MainActor
public enum HomeViewBuilder {
    public static func build() -> some View {
        let client = NetworkFactory.makeDefaultClient()
        let repo = HomeRepository(client: client)

        return HomeView(getHomeFeedUseCase: repo)
    }
}
