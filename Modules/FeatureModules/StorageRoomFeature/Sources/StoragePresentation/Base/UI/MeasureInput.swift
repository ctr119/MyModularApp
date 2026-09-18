import DesignSystem
import StorageDomain
import SwiftUI

struct MeasureInput: View {
    @Binding var measure: Decimal
    @Binding var unit: Measure.Unit
    let promptText: String

    var body: some View {
        HStack {
            TextField(
                "",
                value: $measure,
                format: .number,
                prompt: Text(promptText)
            )
            .dsTextStyle(.callout)
            .layoutPriority(1)

            Picker("", selection: $unit) {
                ForEach(Measure.Unit.allCases, id: \.self) {
                    Text($0.localizedStringResource)
                }
            }
            .tint(.black)
            .fixedSize()
        }
    }
}

#Preview {
    @Previewable @State
    var measure: Decimal = 10

    @Previewable @State
    var unit: Measure.Unit = .cm

    ThemedPreview(theme: .light) {
        MeasureInput(
            measure: $measure,
            unit: $unit,
            promptText: "Just a prompt"
        )
    }
}
