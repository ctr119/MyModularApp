import Foundation
import SwiftData

public protocol StorageRoomDataSource: Actor {
    func add(item: StoredItemDTO, to module: ModuleDTO) throws
    func add(module: ModuleDTO, to room: StorageRoomDTO) throws
    func add(room: StorageRoomDTO) throws

    func remove(item: StoredItemDTO) throws
    func remove(module: ModuleDTO) throws
    func remove(room: StorageRoomDTO) throws

    func fetchRoomDetails(id: UUID) throws -> StorageRoomDTO?
    func fetchRooms(hydratingItems: Bool, _ limit: Int) throws -> [StorageRoomDTO]
    func fetchRooms(where itemQuery: String, limit: Int) throws -> [StorageRoomDTO]
    func fetchItems(using query: String, _ limit: Int) throws -> [StoredItemDTO]
}

@ModelActor
actor StorageRoomDataSourceImpl: StorageRoomDataSource {
    func add(item: StoredItemDTO, to module: ModuleDTO) throws {
        let moduleId = module.id
        var fetchDescriptor = FetchDescriptor<ModuleEntity>(predicate: #Predicate {
            $0.mid == moduleId
        })
        fetchDescriptor.fetchLimit = 1

        let moduleEntities = try modelContext.fetch(fetchDescriptor)
        guard let existingModule = moduleEntities.first else {
            return
        }

        let newItemEntity = item.toEntity(in: existingModule)
        modelContext.insert(newItemEntity)

        try saveAfterChanges()
    }

    func add(module: ModuleDTO, to room: StorageRoomDTO) throws {
        let roomId = room.id
        var fetchDescriptor = FetchDescriptor<StorageRoomEntity>(predicate: #Predicate {
            $0.rid == roomId
        })
        fetchDescriptor.fetchLimit = 1

        let roomEntities = try modelContext.fetch(fetchDescriptor)
        guard let roomEntity = roomEntities.first else {
            return
        }

        let newModuleEntity = module.toEntity(in: roomEntity)
        modelContext.insert(newModuleEntity)

        try saveAfterChanges()
    }

    func add(room: StorageRoomDTO) throws {
        let roomId = room.id
        var fetchDescriptor = FetchDescriptor<StorageRoomEntity>(predicate: #Predicate {
            $0.rid == roomId
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
        let itemId = item.id
        try modelContext.delete(model: StoredItemEntity.self, where: #Predicate {
            $0.iid == itemId
        })

        try saveAfterChanges()
    }

    func remove(module: ModuleDTO) throws {
        let moduleId = module.id
        try modelContext.delete(model: ModuleEntity.self, where: #Predicate {
            $0.mid == moduleId
        })

        try saveAfterChanges()
    }

    func remove(room: StorageRoomDTO) throws {
        let roomId = room.id
        try modelContext.delete(model: StorageRoomEntity.self, where: #Predicate {
            $0.rid == roomId
        })

        try saveAfterChanges()
    }

    private func saveAfterChanges() throws {
        if modelContext.hasChanges {
            try modelContext.save()
        }
    }

    func fetchRoomDetails(id: UUID) throws -> StorageRoomDTO? {
        let copyId = id
        var sortedDescriptor = FetchDescriptor<StorageRoomEntity>(
            predicate: #Predicate {
                $0.rid == copyId
            }
        )
        sortedDescriptor.fetchLimit = 1

        let rooms = try modelContext.fetch(sortedDescriptor)

        return rooms.map {
            $0.toDto(hydratingModules: true, hydratingItems: true)
        }.first
    }

    func fetchRooms(hydratingItems: Bool, _ limit: Int) throws -> [StorageRoomDTO] {
        var sortedDescriptor = FetchDescriptor<StorageRoomEntity>(
            sortBy: [SortDescriptor(\.name)]
        )
        sortedDescriptor.fetchLimit = limit

        let rooms = try modelContext.fetch(sortedDescriptor)

        return rooms.map {
            $0.toDto(hydratingModules: true, hydratingItems: hydratingItems)
        }
    }

    func fetchRooms(where itemQuery: String, limit: Int) throws -> [StorageRoomDTO] {
        var descriptor = FetchDescriptor<StorageRoomEntity>(
            predicate: #Predicate { room in
                room.modules.contains { module in
                    module.items.contains { item in
                        item.name.contains(itemQuery)
                    }
                }
            },
            sortBy: [SortDescriptor(\.name)]
        )
        descriptor.fetchLimit = 100

        let rooms = try modelContext.fetch(descriptor)

        return rooms.map { $0.toDto() }
    }

    func fetchItems(using query: String, _ limit: Int) throws -> [StoredItemDTO] {
        let normalizedQuery = query.trimmingCharacters(in: .whitespacesAndNewlines)

        var filteredDescriptor = FetchDescriptor<StoredItemEntity>(
            predicate: #Predicate {
                $0.name.contains(normalizedQuery)
            }
        )
        filteredDescriptor.fetchLimit = limit

        let filteredItems = try modelContext.fetch(filteredDescriptor)

        return filteredItems.map {
            $0.toDto
        }
    }
}


