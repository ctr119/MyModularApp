import Foundation

extension Error {
    func toAlertItem(_ action: AlertItem.Action? = nil) -> AlertItem {
        .error(message: localizedDescription, action: action)
    }
}
