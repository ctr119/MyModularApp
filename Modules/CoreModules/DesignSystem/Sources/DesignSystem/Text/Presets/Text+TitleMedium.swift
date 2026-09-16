import Foundation

public extension DesignSystem.Text {
    static var titleMedium: DesignSystem.Text {
        .init {
            .init(
                font: .playfairDisplay(.medium),
                isUppercase: false,
                size: 18
            )
        }
    }
}
