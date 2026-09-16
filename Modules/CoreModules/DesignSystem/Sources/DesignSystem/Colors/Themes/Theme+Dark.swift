import Foundation

extension DesignSystem.Theme {
    public static var dark: DesignSystem.Theme {
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
