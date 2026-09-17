import Foundation

public extension DesignSystem.Text {
    static var bodyMedium: DesignSystem.Text {
        .init {
            .init(
                font: .ibmPlexSans(.regular),
                isUppercase: false,
                size: 14
            )
        }
    }
}
