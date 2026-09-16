import Foundation

public extension DesignSystem.Text {
    static var bodyMedium: DesignSystem.Text {
        .init {
            .init(
                font: .inter(.regular),
                isUppercase: false,
                size: 14
            )
        }
    }
}
