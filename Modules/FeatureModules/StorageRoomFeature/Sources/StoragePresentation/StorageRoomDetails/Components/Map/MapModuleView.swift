import StorageDomain
import SwiftUI

struct MapModuleView: View {
    let module: Module

    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(.blue)
            .overlay {
                Text(module.label)
                    .font(.caption)
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
        )
    )
}
