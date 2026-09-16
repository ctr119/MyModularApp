import Foundation

public extension DesignSystem.Text {
    static var titleLarge: DesignSystem.Text {
        .init {
            .init(
                font: .playfairDisplay(.semibold),
                isUppercase: false,
                size: 20
            )
        }
    }
}
