import Foundation

public extension DesignSystem.Text {
    static var displayMedium: DesignSystem.Text {
        .init {
            .init(
                font: .playfairDisplay(.bold),
                isUppercase: false,
                size: 40
            )
        }
    }
}
