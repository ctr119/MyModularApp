import Foundation
import SwiftData

public protocol StorageRoomDataSource: Actor {
    func add(item: StoredItemDTO, to module: ModuleDTO) throws
    func add(module: ModuleDTO, to room: StorageRoomDTO) throws
    func add(room: StorageRoomDTO) throws

    func remove(item: StoredItemDTO) throws
    func remove(module: ModuleDTO) throws
    func remove(room: StorageRoomDTO) throws

    func fetchAllRooms() throws -> [StorageRoomDTO]
    func search(term: String) throws -> [StoredItemDTO]
}

@ModelActor
actor StorageRoomDataSourceImpl: StorageRoomDataSource {
    func add(item: StoredItemDTO, to module: ModuleDTO) throws {
        var fetchDescriptor = FetchDescriptor<ModuleEntity>(predicate: #Predicate {
            $0.id == module.id
        })
        fetchDescriptor.fetchLimit = 1

        let moduleEntities = try modelContext.fetch(fetchDescriptor)
        guard let existingModule = moduleEntities.first else {
            return
        }

        let newItemEntity = item.toEntity(in: existingModule)
        existingModule.items.append(newItemEntity)

        try saveAfterChanges()
    }

    func add(module: ModuleDTO, to room: StorageRoomDTO) throws {
        var fetchDescriptor = FetchDescriptor<StorageRoomEntity>(predicate: #Predicate {
            $0.id == room.id
        })
        fetchDescriptor.fetchLimit = 1

        let roomEntities = try modelContext.fetch(fetchDescriptor)
        guard let roomEntity = roomEntities.first else {
            return
        }

        let newModuleEntity = module.toEntity(in: roomEntity)
        roomEntity.modules.append(newModuleEntity)

        try saveAfterChanges()
    }

    func add(room: StorageRoomDTO) throws {
        var fetchDescriptor = FetchDescriptor<StorageRoomEntity>(predicate: #Predicate {
            $0.id == room.id
        })
        fetchDescriptor.fetchLimit = 1

        let count = try modelContext.fetchCount(fetchDescriptor)
        guard count == 0 else {
            return
        }

        let newRoomEntity = room.toEntity
        modelContext.insert(newRoomEntity)

        try saveAfterChanges()
    }

    func remove(item: StoredItemDTO) throws {
        try modelContext.delete(model: StoredItemEntity.self, where: #Predicate {
            $0.id == item.id
        })

        try saveAfterChanges()
    }

    func remove(module: ModuleDTO) throws {
        try modelContext.delete(model: ModuleEntity.self, where: #Predicate {
            $0.id == module.id
        })

        try saveAfterChanges()
    }

    func remove(room: StorageRoomDTO) throws {
        try modelContext.delete(model: StorageRoomEntity.self, where: #Predicate {
            $0.id == room.id
        })

        try saveAfterChanges()
    }

    private func saveAfterChanges() throws {
        if modelContext.hasChanges {
            try modelContext.save()
        }
    }

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


