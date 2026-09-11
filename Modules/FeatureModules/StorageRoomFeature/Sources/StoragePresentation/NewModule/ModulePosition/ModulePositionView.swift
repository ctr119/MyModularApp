import SwiftUI
import StorageDomain

struct ModulePositionView: View {
    @State private var position: Module.Position = .zero
    @State private var dragTranslation: CGSize = .zero
    @State private var mapSize: CGSize = .zero

    let module: Module
    let room: StorageRoom

    var body: some View {
        ZStack(alignment: .topLeading) {
            map.onGeometryChange(for: CGSize.self) { proxy in
                proxy.size
            } action: { newSize in
                mapSize = newSize
            }

            Rectangle()
                .frame(
                    width: moduleSize.width,
                    height: moduleSize.height
                )
                .foregroundStyle(.red)
                .offset(offset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            dragTranslation = value.translation
                        }
                        .onEnded { _ in
                            let settledOffset = offset
                            dragTranslation = .zero
                            position = Module.Position(
                                x: settledOffset.width,
                                y: settledOffset.height
                            )
                        }
                )
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {

                } label: {
                    Image(systemName: "checkmark")
                }
            }
        }
    }

    private var cellPointSize: CGFloat {
        guard room.gridCols > 0 else {
            return 0
        }
        return mapSize.width / CGFloat(room.gridCols)
    }

    private var moduleSize: CGSize {
        CGSize(
            width: room.cellUnits(for: module.realWidth) * cellPointSize,
            height: room.cellUnits(for: module.realDepth) * cellPointSize
        )
    }

    private var offset: CGSize {
        CGSize(
            width: clamp(
                position.x + dragTranslation.width,
                upperBound: mapSize.width - moduleSize.width
            ),
            height: clamp(
                position.y + dragTranslation.height,
                upperBound: mapSize.height - moduleSize.height
            )
        )
    }

    private func clamp(_ value: CGFloat, upperBound: CGFloat) -> CGFloat {
        min(max(value, 0), max(upperBound, 0))
    }

    private var map: some View {
        StorageMapLayout(room: room) {
            ForEach(room.modules) { module in
                MapModuleView(
                    module: module,
                    isTargeted: false
                )
            }
        }
        .background {
            StorageGridBackground(
                rows: room.gridRows,
                cols: room.gridCols,
                backgroundColor: .white,
                cornerRadius: 8
            )
        }
    }
}

#Preview {
    ModulePositionView(
        module: StorageRoom.mock.modules.first!,
        room: .mock
    )
}
