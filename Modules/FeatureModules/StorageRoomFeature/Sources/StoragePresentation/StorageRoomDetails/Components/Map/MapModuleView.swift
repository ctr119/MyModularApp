import StorageDomain
import SwiftUI

struct MapModuleView: View {
    let module: Module
    let isTargeted: Bool

    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(.blue)
            .overlay {
                Text(module.label)
                    .font(.caption)
            }
            .overlay {
                // TODO: Change the stroke by a pulsed red dot animation
                if isTargeted {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.red, lineWidth: 2)
                        .transition(.opacity)
                }
            }
    }
}

#Preview {
    MapModuleView(
        module: .init(
            id: UUID(),
            label: "Kitchen",
            realWidth: .init(amount: 50, unit: .cm),
            realDepth: .init(amount: 30, unit: .cm),
            position: .init(x: 0, y: 0),
            items: []
        ),
        isTargeted: true
    )
}
