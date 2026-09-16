import Foundation

public extension DesignSystem.Text {
    static var titleSmall: DesignSystem.Text {
        .init {
            .init(
                font: .playfairDisplay(.medium),
                isUppercase: false,
                size: 16
            )
        }
    }
}
