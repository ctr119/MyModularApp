import Foundation

public extension DesignSystem.Text {
    static var displayLarge: DesignSystem.Text {
        .init {
            .init(
                font: .playfairDisplay(.bold),
                isUppercase: false,
                size: 48
            )
        }
    }
}
