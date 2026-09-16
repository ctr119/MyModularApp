import Foundation

public extension DesignSystem {
    struct TextField: Sendable {
        struct Configuration: Sendable {
            let textStyle: DesignSystem.Text
            let applyColorToDecorations: Bool
        }
        
        public struct Options: Sendable {
            public static var defaultOptions: Options { .init() }
            
            let iconName: String
            let isIconVisible: Bool
            let isUnderlineVisible: Bool
            
            public init(
                iconName: String = "",
                isIconVisible: Bool = true,
                isUnderlineVisible: Bool = true
            ) {
                self.iconName = iconName
                self.isIconVisible = isIconVisible
                self.isUnderlineVisible = isUnderlineVisible
            }
        }
        
        let configuration: @Sendable () -> Configuration
    }
}
