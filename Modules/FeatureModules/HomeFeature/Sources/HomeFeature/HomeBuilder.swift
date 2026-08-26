import HomeData
import HomeDomain
import HomePresentation
import NetworkKit
import SwiftUI

@MainActor
public enum HomeViewBuilder {
    public static func build() -> some View {
        let networkExecutor = NetworkExecutorFactory.make(
            with: .baseUrl(.init(string: "The URL you want"))
        )
        let repo = HomeRepository(networkExecutor: networkExecutor)

        return HomeView(getHomeFeedUseCase: repo)
    }
}
