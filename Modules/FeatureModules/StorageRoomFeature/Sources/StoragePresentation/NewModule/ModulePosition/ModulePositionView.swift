import SwiftUI
import StorageDomain

struct ModulePositionView: View {
    @State private var viewModel: ModulePositionViewModel

    @State private var dragTranslation: CGSize = .zero
    @State private var mapSize: CGSize = .zero

    init(
        module: Module,
        room: StorageRoom,
        dependencies: ModulePositionDependencies
    ) {
        _viewModel = State(
            wrappedValue: ModulePositionViewModel(
                module: module,
                room: room,
                dependencies: dependencies
            )
        )
    }

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
                            viewModel.position = Module.Position(
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
        guard viewModel.room.gridCols > 0 else {
            return 0
        }
        return mapSize.width / CGFloat(viewModel.room.gridCols)
    }

    private var moduleSize: CGSize {
        let widthUnits = viewModel.room
            .cellUnits(for: viewModel.module.realWidth)
        let depthUnits = viewModel.room
            .cellUnits(for: viewModel.module.realDepth)

        return CGSize(
            width: widthUnits * cellPointSize,
            height: depthUnits * cellPointSize
        )
    }

    private var offset: CGSize {
        CGSize(
            width: clamp(
                viewModel.position.x + dragTranslation.width,
                upperBound: mapSize.width - moduleSize.width
            ),
            height: clamp(
                viewModel.position.y + dragTranslation.height,
                upperBound: mapSize.height - moduleSize.height
            )
        )
    }

    private func clamp(_ value: CGFloat, upperBound: CGFloat) -> CGFloat {
        min(max(value, 0), max(upperBound, 0))
    }

    private var map: some View {
        StorageMapLayout(room: viewModel.room) {
            ForEach(viewModel.room.modules) { module in
                MapModuleView(
                    module: module,
                    isTargeted: false
                )
            }
        }
        .background {
            StorageGridBackground(
                rows: viewModel.room.gridRows,
                cols: viewModel.room.gridCols,
                backgroundColor: .white,
                cornerRadius: 8
            )
        }
    }
}

#Preview {
    ModulePositionView(
        module: StorageRoom.mock.modules.first!,
        room: .mock,
        dependencies: .mock()
    )
}
