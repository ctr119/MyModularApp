import Foundation

public protocol SearchItemsUseCase {
    func callAsFunction(_ term: String) async -> [SearchItem]
}

