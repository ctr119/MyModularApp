import Foundation
import SwiftUI

extension DesignSystem.Theme {
    public static var light: DesignSystem.Theme {
        .init(semanticMap: [
            .accent(.primary):      .teal,
            .accent(.secondary):    .brown,

            .border(.primary):      .gray500,
            .border(.secondary):    .gray200,

            .brand(.primary):       .teal,
            .brand(.secondary):     .brown,

            .button(.primary):      .teal,
            .button(.secondary):    .brown,

            .feedback(.success):    .green,
            .feedback(.warning):    .yellow,
            .feedback(.error):      .red,

            .icon(.item):           .orange,
            .icon(.module):         .brown,
            .icon(.room):           .teal,

            .surface(.primary):     .gray50,
            .surface(.secondary):   .gray100,
            .surface(.warning):     .yellowLight,
            .surface(.error):       .redLight,

            .text(.primary):        .gray900,
            .text(.secondary):      .gray500,
            .text(.tertiary):       .gray50,
        ])
    }
}

#Preview {
    let map = DesignSystem.Theme.light.semanticMap
    let sortedKeys = map.keys.sorted { lhs, rhs in
        lhs.name < rhs.name
    }

    ThemedPreview(theme: .light) {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ForEach(sortedKeys, id: \.self) { key in
                    HStack {
                        Text(key.name)
                        Spacer()
                        RoundedRectangle(cornerRadius: 10)
                            .fill(
                                Color(UIColor(hexString: map[key]!.rawValue))
                            )
                            .frame(width: 40, height: 40)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
    }
}
