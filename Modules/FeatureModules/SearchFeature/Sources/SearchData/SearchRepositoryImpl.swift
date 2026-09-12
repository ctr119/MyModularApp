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
            let rooms = try await storageRoomDataSource.fetchRooms(where: term, limit: 100)

            let matchingSearchItemsPerRoom: [[SearchItem]] = rooms.map { room in
                room.modules.compactMap { module in
                    let searchItems = module.items.filter {
                        $0.name.contains(term)
                    }.map {
                        SearchItem(
                            id: $0.id,
                            name: $0.name,
                            module: .init(
                                id: module.id,
                                name: module.label
                            ),
                            room: .init(
                                id: room.id,
                                name: room.name
                            )
                        )
                    }
                    return searchItems
                }.flatMap { $0 }
            }

            return matchingSearchItemsPerRoom.flatMap { $0 }
        } catch {
            return []
        }
    }
}

