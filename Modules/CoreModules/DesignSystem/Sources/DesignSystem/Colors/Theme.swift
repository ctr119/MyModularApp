import Foundation

public extension DesignSystem {
    struct Theme: Sendable, Equatable {
        let semanticMap: [DesignSystem.Color: PrimitiveToken]
        
        func color(_ color: DesignSystem.Color) -> String {
            semanticMap[color]?.rawValue ?? ""
        }
        
        func check() {
            for color in DesignSystem.Color.allCasesCompact {
                if semanticMap[color] == nil {
                    assertionFailure("Color \(color) is missing in theme \(self)")
                }
            }
        }
    }
}
