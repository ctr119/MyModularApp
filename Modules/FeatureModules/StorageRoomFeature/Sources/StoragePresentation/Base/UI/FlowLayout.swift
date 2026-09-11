import SwiftUI

struct FlowLayout: Layout {
    var spacing: CGFloat = 20

    struct CacheData {
        var sizes: [CGSize]
    }

    func makeCache(subviews: Subviews) -> CacheData {
        let subviewSizes = subviews.map { $0.sizeThatFits(.unspecified) }
        return CacheData(sizes: subviewSizes)
    }

    func updateCache(_ cache: inout CacheData, subviews: Subviews) {
        cache.sizes = subviews.map { $0.sizeThatFits(.unspecified) }
    }

    func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout CacheData
    ) -> CGSize {
        let maxWidth = proposal.width ?? .infinity
        var currentX: CGFloat = 0
        var currentY: CGFloat = 0
        var maxHeightOnLine: CGFloat = 0
        var totalWidth: CGFloat = 0

        for size in cache.sizes {
            // If overflow... jump onto new line
            if currentX + size.width > maxWidth && currentX > 0 {
                currentX = 0
                currentY += maxHeightOnLine + spacing
                maxHeightOnLine = 0
            }

            maxHeightOnLine = max(maxHeightOnLine, size.height)
            currentX += size.width + spacing
            totalWidth = max(totalWidth, currentX)
        }

        return CGSize(
            width: totalWidth,
            height: currentY + maxHeightOnLine
        )
    }

    func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout CacheData
    ) {
        let maxWidth = bounds.width
        var currentX: CGFloat = 0
        var currentY: CGFloat = 0
        var maxHeightOnLine: CGFloat = 0

        for (index, subview) in subviews.enumerated() {
            let size = cache.sizes[index]

            // If overflow... jump onto new line
            if currentX + size.width > maxWidth && currentX > 0 {
                currentX = 0
                currentY += maxHeightOnLine + spacing
                maxHeightOnLine = 0
            }

            let point = CGPoint(
                x: bounds.minX + currentX,
                y: bounds.minY + currentY
            )

            subview.place(at: point, proposal: .unspecified)

            maxHeightOnLine = max(maxHeightOnLine, size.height)
            currentX += size.width + spacing
        }
    }
}
