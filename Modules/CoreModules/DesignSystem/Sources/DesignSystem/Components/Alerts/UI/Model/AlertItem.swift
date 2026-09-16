import Foundation

struct AlertItem: Identifiable, Equatable {
    static func info(message: String, action: Action? = nil) -> AlertItem {
        .init(message: message, style: .info, action: action)
    }
    
    static func warning(message: String, action: Action? = nil) -> AlertItem {
        .init(message: message, style: .warning, action: action)
    }
    
    static func error(message: String, action: Action? = nil) -> AlertItem {
        .init(message: message, style: .error, action: action)
    }
    
    let id = UUID()
    let message: String
    let style: DesignSystem.Alert
    let action: Action?
    
    private init(
        message: String,
        style: DesignSystem.Alert,
        action: Action?
    ) {
        self.message = message
        self.style = style
        self.action = action
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}
