import Foundation

extension DesignSystem {
    struct Alert {
        struct Configuration {
            struct Icon {
                let name: String
                let color: DesignSystem.Color
            }
            
            struct Border {
                let width: CGFloat
                let color: DesignSystem.Color
            }
            
            let textStyle: DesignSystem.Text
            let backgroundColor: DesignSystem.Color
            let foregroundColor: DesignSystem.Color
            let cornerRadius: CGFloat
            let stroke: Border
            let icon: Icon
        }
        
        let config: () -> Configuration
    }
}
