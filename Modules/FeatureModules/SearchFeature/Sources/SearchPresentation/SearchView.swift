import SearchDomain
import SwiftUI

public struct SearchView<Content: View>: View {
    @Binding var searchText: String
    @State private var viewModel: SearchViewModel
    @State private var router: SearchRouter<Content>

    public init(
        searchText: Binding<String>,
        dependencies: SearchDependencies,
        @ViewBuilder navigationEventHandler: @escaping (SearchNavigationEvent) -> Content
    ) {
        self._searchText = searchText
        self._viewModel = State(
            wrappedValue: SearchViewModel(container: dependencies)
        )
        self._router = State(
            wrappedValue: SearchRouter(
                navigationEventHandler: navigationEventHandler
            )
        )
    }

    public var body: some View {
        NavigationStack(path: $router.path) {
            List {
                SearchResultCellView()
                    .onTapGesture {
                        router.handle(event: .resultTapped(id: 0))
                    }
            }
            .navigationDestination(
                for: SearchNavigationEvent.self,
                destination: { event in
                    router.view(for: event)
            })
            .navigationTitle("Search")
        }
    }
}

#Preview {
    SearchView(
        searchText: .constant("Text something"),
        dependencies: .init(
            searchItemsUseCase: SearchItemsUseCasePreviewMock()
        ),
        navigationEventHandler: { event in
            Text("Mock")
        }
    )
}
