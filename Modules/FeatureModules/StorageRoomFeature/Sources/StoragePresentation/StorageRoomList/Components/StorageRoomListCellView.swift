import StorageDomain
import SwiftUI

struct StorageRoomListCellView: View {
    private let modulesToDisplayLimit = 3

    let room: StorageRoom

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading, spacing: 2) {
                Text(room.name)
                    .font(.headline)

                surfaceLabel
            }

            modulesSneakPeak

            if room.modules.count > modulesToDisplayLimit {
                Text("+^[\(room.modules.count - modulesToDisplayLimit) more package](inflect: true)")
                    .font(.caption2.italic().monospaced())
            }

            capacityBar
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.yellow)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .gray.opacity(0.5), radius: 2, x: 0, y: 4)
    }

    private var surfaceLabel: some View {
        let area = room.realDepth * room.realWidth
        let areaLabel = area.description + "2"

        return Text("Surface: \(areaLabel)")
            .font(.caption2.monospaced())
    }

    private var modulesSneakPeak: some View {
        VStack(alignment: .leading) {
            ForEach(room.modules.prefix(modulesToDisplayLimit), id: \.id) { module in
                modulesCell(module)
            }
        }
        .font(.callout.monospaced())
    }

    private func modulesCell(_ module: Module) -> some View {
        HStack {
            Image(systemName: "shippingbox.fill")
                .foregroundStyle(.brown)
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
                .tint(.pink)

            Text(perc, format: .percent)
        }
        .font(.caption2.monospaced())
    }
}

#Preview {
    StorageRoomListCellView(room: .mock)
}
