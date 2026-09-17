import Foundation

public extension DesignSystem.Text {
    static var label: DesignSystem.Text {
        .init {
            .init(
                font: .ibmPlexMono(.medium),
                isUppercase: true,
                size: 12
            )
        }
    }
}
