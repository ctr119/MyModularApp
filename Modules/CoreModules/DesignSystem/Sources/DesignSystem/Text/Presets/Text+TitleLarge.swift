import Foundation

public extension DesignSystem.Text {
    static var titleLarge: DesignSystem.Text {
        .init {
            .init(
                font: .montserrat(.bold),
                isUppercase: false,
                size: 32
            )
        }
    }
}
