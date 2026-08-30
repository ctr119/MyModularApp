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
                    label: "1",
                    realWidth: .init(amount: 50, unit: .cm),
                    realDepth: .init(amount: 30, unit: .cm),
                    position: .init(x: 0, y: 0),
                    items: []
                ),
                .init(
                    id: UUID(),
                    label: "2",
                    realWidth: .init(amount: 20, unit: .cm),
                    realDepth: .init(amount: 30, unit: .cm),
                    position: .init(x: 0, y: 40),
                    items: []
                ),
                .init(
                    id: UUID(),
                    label: "3",
                    realWidth: .init(amount: 20, unit: .cm),
                    realDepth: .init(amount: 30, unit: .cm),
                    position: .init(x: 0, y: 40),
                    items: []
                ),
                .init(
                    id: UUID(),
                    label: "4",
                    realWidth: .init(amount: 20, unit: .cm),
                    realDepth: .init(amount: 30, unit: .cm),
                    position: .init(x: 0, y: 40),
                    items: []
                ),
                .init(
                    id: UUID(),
                    label: "5",
                    realWidth: .init(amount: 20, unit: .cm),
                    realDepth: .init(amount: 30, unit: .cm),
                    position: .init(x: 0, y: 40),
                    items: []
                )
            ]
        )
    }
}
