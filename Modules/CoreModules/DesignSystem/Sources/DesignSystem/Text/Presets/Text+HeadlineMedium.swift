import Foundation

public extension DesignSystem.Text {
    static var headlineMedium: DesignSystem.Text {
        .init {
            .init(
                font: .playfairDisplay(.semibold),
                isUppercase: false,
                size: 28
            )
        }
    }
}
