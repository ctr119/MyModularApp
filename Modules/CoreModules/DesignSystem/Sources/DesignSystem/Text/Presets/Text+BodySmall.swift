import Foundation

public extension DesignSystem.Text {
    static var bodySmall: DesignSystem.Text {
        .init {
            .init(
                font: .inter(.regular),
                isUppercase: false,
                size: 12
            )
        }
    }
}
