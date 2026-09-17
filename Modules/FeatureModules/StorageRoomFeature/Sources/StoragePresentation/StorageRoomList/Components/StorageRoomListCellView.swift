import DesignSystem
import StorageDomain
import SwiftUI

struct StorageRoomListCellView: View {
    private let cornerRadius: CGFloat = 15
    private let modulesToDisplayLimit = 3

    let room: StorageRoom

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading, spacing: 2) {
                Text(room.name)
                    .dsTextStyle(.subTitle, weight: .bold)

                surfaceLabel
            }

            modulesSneakPeak

            if room.modules.count > modulesToDisplayLimit {
                Text("+^[\(room.modules.count - modulesToDisplayLimit) more package](inflect: true)")
                    .dsTextStyle(.caption)
            }

            capacityBar
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(color: .surface(.secondary))
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        .shadow(
            color: .gray.opacity(0.5),
            radius: 10,
            x: 0,
            y: 0
        )
    }

    private var surfaceLabel: some View {
        let area = room.realDepth * room.realWidth
        let areaLabel = area.description + "2"

        return Text("Surface: \(areaLabel)")
            .dsTextStyle(.caption)
    }

    private var modulesSneakPeak: some View {
        VStack(alignment: .leading) {
            ForEach(room.modules.prefix(modulesToDisplayLimit), id: \.id) { module in
                modulesCell(module)
            }
        }
        .dsTextStyle(.label)
    }

    private func modulesCell(_ module: Module) -> some View {
        HStack {
            Image(systemName: "shippingbox.fill")
                .foreground(color: .icon(.module))
            Text(module.label)
        }
    }

    @ViewBuilder
    private var capacityBar: some View {
        let value: CGFloat = 30
        let max: CGFloat = 100
        let perc = value / 100

        HStack {
            ProgressView(value: value, total: max)
                .progressViewStyle(.linear)
                .tint(color: .accent(.primary))

            Text(perc, format: .percent)
                .dsTextStyle(.caption)
        }
    }
}

#Preview {
    DesignSystem.initialize()

    return StorageRoomListCellView(room: .mock)
}
