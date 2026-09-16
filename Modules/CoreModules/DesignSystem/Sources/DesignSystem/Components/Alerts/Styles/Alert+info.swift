import Foundation

extension DesignSystem.Alert {
    static var info: DesignSystem.Alert {
        .init {
            .init(
                textStyle: .bodyMedium,
                backgroundColor: .surface(.secondary),
                foregroundColor: .text(.primary),
                cornerRadius: 20,
                stroke: .init(width: 1, color: .border(.primary)),
                icon: .init(name: "info.circle", color: .text(.primary))
            )
        }
    }
}
