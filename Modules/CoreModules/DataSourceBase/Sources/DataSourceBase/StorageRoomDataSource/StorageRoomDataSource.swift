import Foundation
import SwiftData

public protocol StorageRoomDataSource: Actor {
    func fetchAllRooms() throws -> [StorageRoomDTO]
    func search(term: String) throws -> [StoredItemDTO]
}

@ModelActor
actor StorageRoomDataSourceImpl: StorageRoomDataSource {
    func fetchAllRooms() throws -> [StorageRoomDTO] {
        let sortedDescriptor = FetchDescriptor<StorageRoomEntity>(
            sortBy: [SortDescriptor(\.name)]
        )

        let rooms = try modelContext.fetch(sortedDescriptor)

        return rooms.map {
            $0.toDto
        }
    }

    func search(term: String) throws -> [StoredItemDTO] {
        let normalizedTerm = term.trimmingCharacters(in: .whitespacesAndNewlines)

        let filteredDescriptor = FetchDescriptor<StoredItemEntity>(
            predicate: #Predicate {
                $0.name.contains(normalizedTerm)
            }
        )

        let filteredItems = try modelContext.fetch(filteredDescriptor)

        return filteredItems.map {
            $0.toDto
        }
    }
}


