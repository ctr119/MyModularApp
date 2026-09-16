import Foundation
import SwiftUI

enum PrimitiveToken: String, CaseIterable, Sendable {
    case white = "#FFFFFF"
    case black = "#000000"
    
    case gray50 = "#FAFAFA"
    case gray100 = "#F5F5F5"
    case gray200 = "#E0E0E0"
    case gray500 = "#757575"
    case gray900 = "#212121"
    
    case green = "#4CAF50"
    case greenLight = "#E8F5E9"

    case yellow = "#FFC107"
    case yellowLight = "#FFF8E1"

    case red = "#F44336"
    case redLight = "#FFEBEE"

    case teal = "#00C3D0"
    case brown = "#AC7F5E"
    case orange = "#FF8D28"
}

#if DEBUG
struct TokenView: View {
    private let dimension: CGFloat = 80
    
    let name: String
    let hex: String
    
    private let color: Color
    
    init(name: String, hex: String) {
        self.name = name
        self.hex = hex
        
        color = Color(UIColor(hexString: hex))
    }
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(color)
                .stroke(.black.opacity(0.3))
                .frame(width: dimension, height: dimension)
            
            Text(verbatim: hex)
            Text(verbatim: name)
                .font(.footnote.smallCaps())
        }
        .bold()
        .monospaced()
    }
}

#Preview {
    ScrollView {
        LazyVGrid(
            columns: [.init(), .init(), .init()],
            spacing: 30
        ) {
            ForEach(PrimitiveToken.allCases, id: \.self) { token in
                TokenView(
                    name: "\(token)",
                    hex: token.rawValue
                )
            }
        }
    }
}
#endif

