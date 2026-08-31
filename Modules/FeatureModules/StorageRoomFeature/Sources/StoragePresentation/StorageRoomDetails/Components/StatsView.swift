import SwiftUI
import StorageDomain

struct StatsView: View {
    let room: StorageRoom

    var body: some View {
        FlowLayout {
            Label {
                Text(room.cellSize.description.replacingOccurrences(of: " ", with: ""))
            } icon: {
                Image(systemName: "square")
            }

            Label {
                Text("\(room.realWidth.description.replacingOccurrences(of: " ", with: ""))")
            } icon: {
                Image(systemName: "arrow.left.and.right")
            }

            Label {
                Text("\(room.realDepth.description.replacingOccurrences(of: " ", with: ""))")
            } icon: {
                Image(systemName: "arrow.up.and.down")
            }

            Label {
                let area = room.realDepth * room.realWidth
                Text("\(area.description.replacingOccurrences(of: " ", with: ""))2")
            } icon: {
                Image(systemName: "square.resize")
            }

            Label {
                Text("30%")
            } icon: {
                Image(systemName: "cube.fill")
            }

        }
        .font(.callout.monospaced())
        .labelIconToTitleSpacing(4)
    }
}

#Preview {
    StatsView(room: .mock)
}
