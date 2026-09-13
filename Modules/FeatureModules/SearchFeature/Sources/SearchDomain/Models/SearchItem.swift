import Foundation

public struct SearchItem: Identifiable {
    public var id: UUID {
        item?.id ?? module.id
    }
    public let item: Item?
    public let module: Module
    public let room: Room

    public init(item: Item?, module: Module, room: Room) {
        self.item = item
        self.module = module
        self.room = room
    }
}
