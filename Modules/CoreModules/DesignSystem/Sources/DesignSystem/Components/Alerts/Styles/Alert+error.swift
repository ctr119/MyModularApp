import Foundation

extension DesignSystem.Alert {
    static var error: DesignSystem.Alert {
        .init {
            .init(
                textStyle: .bodyMedium,
                backgroundColor: .surface(.error),
                foregroundColor: .text(.secondary),
                cornerRadius: 20,
                stroke: .init(width: 1, color: .feedback(.error)),
                icon: .init(
                    name: "exclamationmark.circle",
                    color: .feedback(.error)
                )
            )
        }
    }
}
