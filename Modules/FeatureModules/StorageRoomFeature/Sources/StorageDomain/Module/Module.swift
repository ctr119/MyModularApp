import Foundation

public struct Module: Identifiable, CustomStringConvertible, Sendable {
    public let id: UUID
    public let label: String
    public let realWidth: Measure
    public let realDepth: Measure
    public let position: Position
    public let items: [StoredItem]

    public var description: String {
        "\(label): \(realWidth.description) \(realDepth.description)"
    }

    public init(
        id: UUID,
        label: String,
        realWidth: Measure,
        realDepth: Measure,
        position: Position,
        items: [StoredItem]
    ) {
        self.id = id
        self.label = label
        self.realWidth = realWidth
        self.realDepth = realDepth
        self.position = position
        self.items = items
    }
}
