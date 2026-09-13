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
            let rooms = try await storageRoomDataSource.fetchRooms(containing: term, limit: 100)
            let allModules = rooms.flatMap { $0.modules }

            let matchingModules: [SearchItem] = allModules
                .filter {
                    $0.label.localizedCaseInsensitiveContains(term)
                }
                .compactMap { module in
                    guard let room = rooms.first(
                        where: { room in
                            room.modules.first( where: {
                                module.id == $0.id
                            }) != nil
                        }
                    ) else { return nil }

                    return SearchItem(
                        item: nil,
                        module: .init(id: module.id, name: module.label),
                        room: .init(id: room.id, name: room.name)
                    )
                }

            let matchingItems: [SearchItem] = allModules
                .flatMap { $0.items }
                .filter {
                    $0.name.localizedCaseInsensitiveContains(term)
                }
                .compactMap { item in
                    guard let module = allModules.first(
                        where: { module in
                            module.items.first( where: {
                                item.id == $0.id
                            }) != nil
                        }
                    ) else { return nil }

                    guard let room = rooms.first(
                        where: { room in
                            room.modules.first( where: {
                                module.id == $0.id
                            }) != nil
                        }
                    ) else { return nil }

                    return SearchItem(
                        item: .init(id: item.id, name: item.name),
                        module: .init(id: module.id, name: module.label),
                        room: .init(id: room.id, name: room.name)
                    )
                }

            return matchingItems + matchingModules
        } catch {
            return []
        }
    }
}

