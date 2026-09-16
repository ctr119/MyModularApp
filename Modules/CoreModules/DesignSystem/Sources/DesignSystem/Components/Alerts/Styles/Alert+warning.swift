import Foundation

extension DesignSystem.Alert {
    static var warning: DesignSystem.Alert {
        .init {
            .init(
                textStyle: .bodyMedium,
                backgroundColor: .surface(.warning),
                foregroundColor: .text(.secondary),
                cornerRadius: 20,
                stroke: .init(width: 1, color: .feedback(.warning)),
                icon: .init(
                    name: "exclamationmark.triangle",
                    color: .feedback(.warning)
                )
            )
        }
    }
}
