import Foundation

public protocol SearchItemsUseCase: Sendable {
    func callAsFunction(_ term: String) async -> [SearchItem]
}
