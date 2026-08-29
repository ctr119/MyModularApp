import Foundation

public struct SearchItem {
    public let id: UUID
    public let name: String
    public let module: Module
    public let room: Room

    public init(id: UUID, name: String, module: Module, room: Room) {
        self.id = id
        self.name = name
        self.module = module
        self.room = room
    }
}
