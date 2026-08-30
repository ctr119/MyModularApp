import DataSourceBase
import Foundation
import SearchDomain

public final class SearchRepositoryImpl: Sendable {
    private let storageRoomDataSource: StorageRoomDataSource

    public init(storageRoomDataSource: StorageRoomDataSource) {
        self.storageRoomDataSource = storageRoomDataSource
    }
}

extension SearchRepositoryImpl: SearchItemsUseCase {
    public func callAsFunction(_ term: String) async -> [SearchItem] {
        do {
            let results = try await storageRoomDataSource.search(term: term)
            return results.compactMap { $0.toDomain }
        } catch {
            return []
        }
    }
}

