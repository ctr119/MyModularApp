import Foundation
import SearchDomain

public final class SearchDependencies {
    let searchItemsUseCase: SearchItemsUseCase

    public init(searchItemsUseCase: SearchItemsUseCase) {
        self.searchItemsUseCase = searchItemsUseCase
    }
}
