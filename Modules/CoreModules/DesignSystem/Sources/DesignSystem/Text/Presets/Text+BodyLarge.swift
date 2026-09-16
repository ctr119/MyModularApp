import Foundation

public extension DesignSystem.Text {
    static var bodyLarge: DesignSystem.Text {
        .init {
            .init(
                font: .inter(.regular),
                isUppercase: false,
                size: 16
            )
        }
    }
}
