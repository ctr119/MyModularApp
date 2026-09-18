import Foundation

public extension DesignSystem.Text {
    static var callout: DesignSystem.Text {
        .init {
            .init(
                font: .ibmPlexMono(.regular),
                isUppercase: false,
                size: 14
            )
        }
    }
}
