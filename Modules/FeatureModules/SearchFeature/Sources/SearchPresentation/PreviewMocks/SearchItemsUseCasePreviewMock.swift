import Foundation
import SearchDomain

final class SearchItemsUseCasePreviewMock: SearchItemsUseCase {

    func callAsFunction(_ term: String) async -> [SearchItem] {
        [
            .mock,
            .mock
        ]
    }
}
