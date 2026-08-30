import SearchDomain
import SwiftUI

@MainActor
@Observable
public class SearchViewModel {
    var searchResult: [SearchItem] = []

    @ObservationIgnored
    private let searchItemsUseCase: SearchItemsUseCase

    public init(container: SearchDependencies) {
        self.searchItemsUseCase = container.searchItemsUseCase
    }

    func search(term: String) async {
        let results = await searchItemsUseCase(term)
        searchResult = results
    }
}
