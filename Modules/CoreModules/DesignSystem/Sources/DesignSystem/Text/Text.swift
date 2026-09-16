import Foundation

public extension DesignSystem {
    struct Text: Sendable {
        public enum Font: Sendable {
            public enum Weight: String, Sendable {
                case bold = "Bold"
                case semibold = "SemiBold"
                case medium = "Medium"
                case regular = "Regular"
            }
            
            case inter(_ weight: Weight)
            case playfairDisplay(_ weight: Weight)
            
            func name(_ overridingWeight: Weight? = nil) -> String {
                let (fontName, fontWeight) = switch self {
                case .inter(let weight):
                    ("Inter18pt", weight)

                case .playfairDisplay(let weight):
                    ("PlayfairDisplay", weight)
                }
                
                let weight = if let overridingWeight { overridingWeight } else { fontWeight }
                return "\(fontName)-\(weight.rawValue)"
            }
            
            var ext: String {
                "ttf"
            }
        }
        
        struct Configuration: Sendable {
            let font: Font
            let isUppercase: Bool
            let size: CGFloat
        }
        
        let configuration: @Sendable () -> Configuration
    }
}
