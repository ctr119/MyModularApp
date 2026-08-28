import Foundation
import SwiftData

extension StorageRoomSchemaV1 {
    @Model
    public class ModuleEntity {
        public var id: UUID
        public var label: String
        public var realWidthAmount: Decimal
        public var realWidthUnit: Int
        public var realDepthAmount: Decimal
        public var realDepthUnit: Int
        public var positionX: Double
        public var positionY: Double

        @Relationship(inverse: \StoredItemEntity.moduleEntity)
        public var items: [StoredItemEntity]

        public var storageRoom: StorageRoomEntity?

        public init(
            id: UUID,
            label: String,
            realWidthAmount: Decimal,
            realWidthUnit: Int,
            realDepthAmount: Decimal,
            realDepthUnit: Int,
            positionX: Double,
            positionY: Double,
            items: [StoredItemEntity],
            storageRoom: StorageRoomEntity? = nil
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
}
