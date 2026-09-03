import StorageDomain
import SwiftUI

struct ModuleStatsView: View {
    let module: Module

    var body: some View {
        FlowLayout {
            Label {
                Text(module.realDepth.description.replacingOccurrences(of: " ", with: ""))
            } icon: {
                Image(systemName: "arrow.up.and.down")
            }

            Label {
                Text("\(module.realWidth.description.replacingOccurrences(of: " ", with: ""))")
            } icon: {
                Image(systemName: "arrow.left.and.right")
            }
        }
        .font(.callout.monospaced())
        .labelIconToTitleSpacing(4)
    }
}

#Preview {
    ModuleStatsView(module: StorageRoom.mock.modules.first!)
}
