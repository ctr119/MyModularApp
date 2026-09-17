import Foundation

public extension DesignSystem {
    struct Text: Sendable {
        public enum Font: Sendable {
            public enum Weight: String, Sendable {
                case bold = "Bold"
                case light = "Light"
                case medium = "Medium"
                case regular = "Regular"
            }

            case ibmPlexMono(_ weight: Weight)
            case ibmPlexSans(_ weight: Weight)
            case montserrat(_ weight: Weight)
            
            func name(_ overridingWeight: Weight? = nil) -> String {
                let (fontName, fontWeight) = switch self {
                case .ibmPlexMono(let weight):
                    ("IBMPlexMono", weight)

                case .ibmPlexSans(let weight):
                    ("IBMPlexSans", weight)

                case .montserrat(let weight):
                    ("Montserrat", weight)
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
