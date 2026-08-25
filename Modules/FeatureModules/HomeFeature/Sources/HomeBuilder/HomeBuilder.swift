import HomeData
import HomeDomain
import HomeUI
import NetworkKit
import SwiftUI

@MainActor
public enum HomeViewBuilder {
    public static func build() -> some View {
        let networkExecutor = NetworkExecutorFactory.make()
        let repo = HomeRepository(networkExecutor: networkExecutor)

        return HomeView(getHomeFeedUseCase: repo)
    }
}
