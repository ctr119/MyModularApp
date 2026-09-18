import Foundation
import SwiftUI

extension DesignSystem.Theme {
    public static var dark: DesignSystem.Theme {
        .init(semanticMap: [
            .accent(.primary):      .teal,
            .accent(.secondary):    .brown,

            .border(.primary):      .gray500,
            .border(.secondary):    .gray900,

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

            .surface(.primary):     .black,
            .surface(.secondary):   .gray900,
            .surface(.tertiary):    .gray900,
            .surface(.warning):     .yellowLight,
            .surface(.error):       .redLight,

            .text(.primary):        .white,
            .text(.secondary):      .gray200,
            .text(.tertiary):       .gray50,
        ])
    }
}

#Preview {
    let theme = DesignSystem.Theme.dark
    let map = theme.semanticMap
    let sortedKeys = map.keys.sorted { lhs, rhs in
        lhs.name < rhs.name
    }

    ThemedPreview(theme: theme) {
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
