import Foundation

public extension DesignSystem.Text {
    static var labelSmall: DesignSystem.Text {
        .init {
            .init(
                font: .inter(.semibold),
                isUppercase: true,
                size: 12
            )
        }
    }
}
