import Foundation

public extension DesignSystem.Text {
    static var titleMedium: DesignSystem.Text {
        .init {
            .init(
                font: .montserrat(.medium),
                isUppercase: false,
                size: 24
            )
        }
    }
}
