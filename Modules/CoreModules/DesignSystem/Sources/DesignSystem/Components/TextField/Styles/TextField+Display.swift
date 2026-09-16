import Foundation

public extension DesignSystem.TextField {
    static var display: DesignSystem.TextField {
        .init {
            .init(
                textStyle: .displayMedium,
                applyColorToDecorations: true
            )
        }
    }
}
