import Foundation

public extension DesignSystem.Text {
    static var headlineSmall: DesignSystem.Text {
        .init {
            .init(
                font: .playfairDisplay(.medium),
                isUppercase: false,
                size: 24
            )
        }
    }
}
