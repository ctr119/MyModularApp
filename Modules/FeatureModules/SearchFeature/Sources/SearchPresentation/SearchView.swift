import SearchDomain
import SwiftUI

public struct SearchView<Content: View>: View {
    @Binding var searchText: String
    @State private var viewModel: SearchViewModel
    @State private var router: SearchRouter<Content>
    @State private var searchTask: Task<Void, Never>?

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
            List(viewModel.searchResult, id: \.id) { searchItem in
                SearchResultCellView(searchItem: searchItem)
                    .onTapGesture {
                        router.handle(event: .resultTapped(id: searchItem.id))
                    }
            }
            .navigationDestination(
                for: SearchNavigationEvent.self,
                destination: { event in
                    router.view(for: event)
            })
            .navigationTitle("Search")
            .onChange(of: searchText) { _, newValue in
                searchTask?.cancel()
                searchTask = Task {
                    try? await Task.sleep(nanoseconds: 3_000_000)
                    guard !Task.isCancelled else { return }
                    await viewModel.search(term: newValue)
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var searchText: String = ""

    SearchView(
        searchText: $searchText,
        dependencies: .init(
            searchItemsUseCase: SearchItemsUseCasePreviewMock()
        ),
        navigationEventHandler: { event in
            let text = if case let .resultTapped(id) = event {
                "\(id)"
            } else { "n/a" }

            Text(text)
        }
    )
    .task {
        try? await Task.sleep(nanoseconds: 1_000_000)
        searchText = "Pan"
    }
}
