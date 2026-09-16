import Foundation

public extension DesignSystem.Text {
    static var labelLarge: DesignSystem.Text {
        .init {
            .init(
                font: .inter(.semibold),
                isUppercase: true,
                size: 16
            )
        }
    }
}
