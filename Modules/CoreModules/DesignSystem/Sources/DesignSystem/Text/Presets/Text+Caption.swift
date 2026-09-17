import Foundation

public extension DesignSystem.Text {
    static var caption: DesignSystem.Text {
        .init {
            .init(
                font: .ibmPlexMono(.medium),
                isUppercase: false,
                size: 11
            )
        }
    }
}
