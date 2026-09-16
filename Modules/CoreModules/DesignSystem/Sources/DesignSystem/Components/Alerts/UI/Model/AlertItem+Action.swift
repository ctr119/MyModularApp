import Foundation

extension AlertItem {
    struct Action {
        /// Provide an action closure for running some code before the dismiss takes place.
        /// By default, `dismiss` does not specify any additional action, just the dismissal.
        static func dismiss(_ action: (() -> Void)? = nil) -> Self {
            .init(type: .dismiss, action: action)
        }
        
        static func report(_ action: @escaping () -> Void) -> Self {
            .init(type: .report, action: action)
        }
        
        static func retry(_ action: @escaping () -> Void) -> Self {
            .init(type: .retry, action: action)
        }
        
        enum ActionType {
            case dismiss
            case report
            case retry
            
            var iconName: String {
                switch self {
                case .dismiss:
                    "xmark"
                case .report:
                    "ant"
                case .retry:
                    "arrow.counterclockwise"
                }
            }
        }
        
        let type: ActionType
        let action: (() -> Void)?
        
        private init(
            type: ActionType,
            action: (() -> Void)?
        ) {
            self.type = type
            self.action = action
        }
    }
}
