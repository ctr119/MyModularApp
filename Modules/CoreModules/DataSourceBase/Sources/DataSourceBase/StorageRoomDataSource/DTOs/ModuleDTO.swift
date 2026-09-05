import Foundation

public struct ModuleDTO: Sendable {
    public let id: UUID
    public let label: String
    public let realWidthAmount: Decimal
    public let realWidthUnit: Int
    public let realDepthAmount: Decimal
    public let realDepthUnit: Int
    public let positionX: Double
    public let positionY: Double

    public let items: [StoredItemDTO]
    public let storageRoom: StorageRoomDTO?

    public init(
        id: UUID,
        label: String,
        realWidthAmount: Decimal,
        realWidthUnit: Int,
        realDepthAmount: Decimal,
        realDepthUnit: Int,
        positionX: Double,
        positionY: Double,
        items: [StoredItemDTO],
        storageRoom: StorageRoomDTO?
    ) {
        self.id = id
        self.label = label
        self.realWidthAmount = realWidthAmount
        self.realWidthUnit = realWidthUnit
        self.realDepthAmount = realDepthAmount
        self.realDepthUnit = realDepthUnit
        self.positionX = positionX
        self.positionY = positionY
        self.items = items
        self.storageRoom = storageRoom
    }
}

extension ModuleEntity {
    var toDto: ModuleDTO {
        .init(
            id: self.mid,
            label: self.label,
            realWidthAmount: self.realWidthAmount,
            realWidthUnit: self.realWidthUnit,
            realDepthAmount: self.realDepthAmount,
            realDepthUnit: self.realDepthUnit,
            positionX: self.positionX,
            positionY: self.positionY,
            items: self.items.map { $0.toDto },
            storageRoom: self.storageRoom?.toDto
        )
    }
}

extension ModuleDTO {
    func toEntity(in room: StorageRoomEntity) -> ModuleEntity {
        let moduleEntity = ModuleEntity(
            mid: self.id,
            label: self.label,
            realWidthAmount: self.realWidthAmount,
            realWidthUnit: self.realWidthUnit,
            realDepthAmount: self.realDepthAmount,
            realDepthUnit: self.realDepthUnit,
            positionX: self.positionX,
            positionY: self.positionY,
            items: self.items.map { $0.toEntity() },
            storageRoom: room
        )

        moduleEntity.items.forEach { itemEntity in
            itemEntity.moduleEntity = moduleEntity
        }

        return moduleEntity
    }
}
