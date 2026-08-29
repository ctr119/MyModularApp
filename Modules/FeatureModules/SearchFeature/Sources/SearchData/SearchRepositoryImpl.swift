import DataSourceBase
import Foundation
import SearchDomain

final class SearchRepositoryImpl: Sendable {
    private let storageRoomDataSource: StorageRoomDataSource

    init(storageRoomDataSource: StorageRoomDataSource) {
        self.storageRoomDataSource = storageRoomDataSource
    }
}

extension SearchRepositoryImpl: SearchItemsUseCase {
    func callAsFunction(_ term: String) async -> [SearchItem] {
        do {
            let results = try await storageRoomDataSource.search(term: term)
            return results.compactMap { $0.toDomain }
        } catch {
            return []
        }
    }
}

