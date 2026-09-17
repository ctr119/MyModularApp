import Foundation

public extension DesignSystem.TextField {
    static var display: DesignSystem.TextField {
        .init {
            .init(
                textStyle: .display,
                applyColorToDecorations: true
            )
        }
    }
}
