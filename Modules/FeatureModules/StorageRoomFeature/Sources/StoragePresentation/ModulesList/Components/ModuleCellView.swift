import StorageDomain
import SwiftUI

struct ModuleCellView: View {
    let module: Module
    let didTapModule: () -> Void
    let didTapLocateButton: () -> Void

    var body: some View {
        Button {
            didTapModule()
        } label: {
            HStack {
                Text(module.label)
                Spacer()

                HStack(spacing: 20) {
                    Button {
                        didTapLocateButton()
                    } label: {
                        Image(systemName: "dot.scope")
                    }
                    .buttonStyle(.plain)

                    Image(systemName: "chevron.right")
                }
            }
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ModuleCellView(
        module: StorageRoom.mock.modules[0],
        didTapModule: {},
        didTapLocateButton: {}
    )
}
