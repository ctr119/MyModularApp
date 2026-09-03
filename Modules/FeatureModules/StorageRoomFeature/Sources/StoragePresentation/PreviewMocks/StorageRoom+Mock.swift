import StorageDomain
import Foundation

public extension StorageRoom {
    static var mock: StorageRoom {
        .init(
            id: UUID(),
            name: "Storage Room 112",
            cellSize: .init(amount: 1, unit: .m),
            gridRows: 6,
            gridCols: 4,
            modules: [
                .init(
                    id: UUID(),
                    label: "1. Kitchen",
                    realWidth: .init(amount: 50, unit: .cm),
                    realDepth: .init(amount: 30, unit: .cm),
                    position: .init(x: 0, y: 0),
                    items: [
                        .init(id: UUID(), name: "Cutlery", tags: ["metal"]),
                        .init(id: UUID(), name: "Iron Pots", tags: ["metal", "heavy", "healthy", "set", "expensive"]),
                        .init(id: UUID(), name: "Pans", tags: ["metal"]),
                        .init(id: UUID(), name: "Glasses", tags: ["fragile"]),
                    ]
                ),
                .init(
                    id: UUID(),
                    label: "2. Bathroom",
                    realWidth: .init(amount: 20, unit: .cm),
                    realDepth: .init(amount: 30, unit: .cm),
                    position: .init(x: 0, y: 40),
                    items: []
                ),
                .init(
                    id: UUID(),
                    label: "3. Living Room",
                    realWidth: .init(amount: 20, unit: .cm),
                    realDepth: .init(amount: 30, unit: .cm),
                    position: .init(x: 0, y: 40),
                    items: []
                ),
                .init(
                    id: UUID(),
                    label: "4. Main Bedroom",
                    realWidth: .init(amount: 20, unit: .cm),
                    realDepth: .init(amount: 30, unit: .cm),
                    position: .init(x: 0, y: 40),
                    items: []
                ),
                .init(
                    id: UUID(),
                    label: "5. Office",
                    realWidth: .init(amount: 20, unit: .cm),
                    realDepth: .init(amount: 30, unit: .cm),
                    position: .init(x: 0, y: 40),
                    items: []
                )
            ]
        )
    }
}
