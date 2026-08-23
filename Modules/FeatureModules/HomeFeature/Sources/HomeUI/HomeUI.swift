import HomeDomain
import SwiftUI

@Observable
public final class HomeViewModel {
    public var items: [FeedItem] = []

    private let useCase: GetHomeFeedUseCaseProtocol

    public init(useCase: GetHomeFeedUseCaseProtocol) {
        self.useCase = useCase
    }

    @MainActor
    public func load() async {
        self.items = (try? await useCase.execute()) ?? []
    }
}

public struct HomeView: View {
    @State var viewModel: HomeViewModel

    public init(getHomeFeedUseCase: GetHomeFeedUseCaseProtocol) {
        self._viewModel = State(
            initialValue: HomeViewModel(useCase: getHomeFeedUseCase)
        )
    }

    public var body: some View {
        NavigationStack {
            List(viewModel.items) { Text($0.title) }
                .navigationTitle("Home")
                .task { await viewModel.load() }
        }
    }
}
