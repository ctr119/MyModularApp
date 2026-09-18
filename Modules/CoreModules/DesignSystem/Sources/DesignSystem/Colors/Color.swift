import Foundation

public extension DesignSystem {
    enum Color: Hashable, Sendable {
        public enum Accent: CaseIterable, Sendable {
            case primary
            case secondary
        }
        
        public enum Border: CaseIterable, Sendable {
            case primary
            case secondary
        }
        
        public enum Brand: CaseIterable, Sendable {
            case primary
            case secondary
        }
        
        public enum Button: CaseIterable, Sendable {
            case primary
            case secondary
        }
        
        public enum Feedback: CaseIterable, Sendable {
            case success
            case warning
            case error
        }

        public enum Icon: CaseIterable, Sendable {
            case item
            case module
            case room
        }

        public enum Surface: CaseIterable, Sendable {
            case primary
            case secondary
            case tertiary
            case warning
            case error
        }
        
        public enum Text: CaseIterable, Sendable {
            case primary
            case secondary
            case tertiary
        }
        
        case accent(Accent)
        case border(Border)
        case brand(Brand)
        case button(Button)
        case feedback(Feedback)
        case icon(Icon)
        case surface(Surface)
        case text(Text)
        
        var name: String {
            switch self {
            case .accent(let accent):
                "accent/\(accent)"
            case .border(let border):
                "border/\(border)"
            case .brand(let brand):
                "brand/\(brand)"
            case .button(let button):
                "button/\(button)"
            case .feedback(let feedback):
                "feedback/\(feedback)"
            case .icon(let icon):
                "icon/\(icon)"
            case .surface(let surface):
                "surface/\(surface)"
            case .text(let text):
                "text/\(text)"
            }
        }
    }
}

extension DesignSystem.Color {
    static var allCasesCompact: [DesignSystem.Color] {
        [
            Accent.allCases.map(DesignSystem.Color.accent),
            Border.allCases.map(DesignSystem.Color.border),
            Brand.allCases.map(DesignSystem.Color.brand),
            Button.allCases.map(DesignSystem.Color.button),
            Feedback.allCases.map(DesignSystem.Color.feedback),
            Icon.allCases.map(DesignSystem.Color.icon),
            Surface.allCases.map(DesignSystem.Color.surface),
            Text.allCases.map(DesignSystem.Color.text)
        ].flatMap { $0 }
    }
}
