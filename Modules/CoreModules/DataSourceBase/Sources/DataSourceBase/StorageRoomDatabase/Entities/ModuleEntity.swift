import Foundation
import SwiftData

extension StorageRoomSchemaV1 {
    @Model
    class ModuleEntity {
        var mid: UUID
        var label: String
        var realWidthAmount: Decimal
        var realWidthUnit: Int
        var realDepthAmount: Decimal
        var realDepthUnit: Int
        var positionX: Double
        var positionY: Double

        @Relationship(inverse: \StoredItemEntity.moduleEntity)
        var items: [StoredItemEntity]

        var storageRoom: StorageRoomEntity?

        init(
            mid: UUID,
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
            self.mid = mid
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
