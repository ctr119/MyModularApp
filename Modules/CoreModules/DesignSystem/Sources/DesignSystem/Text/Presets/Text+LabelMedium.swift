import Foundation

public extension DesignSystem.Text {
    static var labelMedium: DesignSystem.Text {
        .init {
            .init(
                font: .inter(.semibold),
                isUppercase: true,
                size: 14
            )
        }
    }
}
