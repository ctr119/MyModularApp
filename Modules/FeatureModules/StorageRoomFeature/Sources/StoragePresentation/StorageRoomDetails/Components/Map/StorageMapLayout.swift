import StorageDomain
import SwiftUI

struct StorageMapLayout: Layout {
    private let room: StorageRoom

    init(room: StorageRoom) {
        self.room = room
    }

    struct CacheData {
        var cellPointSize: CGFloat = 0
    }

    func makeCache(subviews: Subviews) -> CacheData {
        CacheData()
    }

    func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout CacheData
    ) -> CGSize {
        let gridCols = room.gridCols
        let gridRows = room.gridRows

        guard gridCols > 0, gridRows > 0 else {
            cache.cellPointSize = 0
            return .zero
        }

        let availableWidth = proposal.width ?? 320
        let cellWidth = availableWidth / CGFloat(gridCols)

        let cellPointSize: CGFloat

        if let proposedHeight = proposal.height, proposedHeight.isFinite {
            let cellHeight = proposedHeight / CGFloat(gridRows)
            cellPointSize = min(cellWidth, cellHeight)
        } else {
            cellPointSize = cellWidth
        }

        cache.cellPointSize = cellPointSize

        return CGSize(
            width: cellPointSize * CGFloat(gridCols),
            height: cellPointSize * CGFloat(gridRows)
        )
    }

    func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout CacheData
    ) {
        let cellPointSize = cache.cellPointSize

        for (index, subview) in subviews.enumerated() {
            let module = room.modules[index]

            let origin = CGPoint(
                x: bounds.minX + module.position.x,
                y: bounds.minY + module.position.y
            )

            let widthUnits = room.cellUnits(for: module.realWidth)
            let heightUnits = room.cellUnits(for: module.realDepth)
            let size = CGSize(
                width: widthUnits * cellPointSize,
                height: heightUnits * cellPointSize
            )

            subview.place(
                at: origin,
                anchor: .topLeading,
                proposal: ProposedViewSize(size)
            )
        }
    }
}
