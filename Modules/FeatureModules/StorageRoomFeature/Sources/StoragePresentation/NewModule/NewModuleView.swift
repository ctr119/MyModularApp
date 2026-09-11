import StorageDomain
import SwiftUI

struct NewModuleView: View {
    @Environment(\.dismiss) var dismiss

    @State private var viewModel: NewModuleViewModel
    @State private var itemToAdd: String = ""

    init(
        room: StorageRoom,
        dependencies: ModulePositionDependencies
    ) {
        _viewModel = State(
            wrappedValue: NewModuleViewModel(
                room: room,
                dependencies: dependencies
            )
        )
    }

    var body: some View {
        NavigationStack(path: $viewModel.router.path) {
            List {
                TextField(
                    "",
                    text: $viewModel.moduleName,
                    prompt: Text("Label your package...")
                        .monospaced()
                )

                dimensionsSection

                itemsSection
            }
            .navigationTitle("New module")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: NewModuleRouter.Destination.self) { destination in
                viewModel.router.view(
                    for: destination,
                    completion: {
                        dismiss()
                    }
                )
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        viewModel.nextSetp()
                    } label: {
                        Image(systemName: "chevron.right")
                    }
                }

                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "trash")
                    }
                }
            }
        }
    }

    private var dimensionsSection: some View {
        Section {
            widthMeasureField
            depthMeasureField
        } header: {
            Text("Dimensions")
                .font(.callout.monospaced())
        }
    }

    private var widthMeasureField: some View {
        LabeledContent {
            MeasureInput(
                measure: $viewModel.widthMeasure.amount,
                unit: $viewModel.widthMeasure.unit,
                promptText: "Enter the width..."
            )
        } label: {
            Text("Width")
                .monospaced()
                .foregroundStyle(.gray.opacity(0.8))
        }
    }

    private var depthMeasureField: some View {
        LabeledContent {
            MeasureInput(
                measure: $viewModel.depthMeasure.amount,
                unit: $viewModel.depthMeasure.unit,
                promptText: "Enter the depth..."
            )
        } label: {
            Text("Depth")
                .monospaced()
                .foregroundStyle(.gray.opacity(0.8))
        }
    }

    private var itemsSection: some View {
        Section {
            TextField(
                "",
                text: $itemToAdd,
                prompt: Text("Add an item...")
                    .monospaced()
            )
            .onSubmit(of: .text) {
                defer {
                    itemToAdd = ""
                }
                withAnimation {
                    viewModel.add(item: itemToAdd)
                }
            }

            if !viewModel.newItems.isEmpty {
                ForEach($viewModel.newItems) { item in
                    NewItemCellView(
                        item: item,
                        didTapRemove: viewModel.remove
                    )
                }
            }
        } header: {
            Text("Items")
                .font(.callout.monospaced())
        }
    }
}

#Preview {
    NewModuleView(
        room: .mock,
        dependencies: .mock()
    )
}
