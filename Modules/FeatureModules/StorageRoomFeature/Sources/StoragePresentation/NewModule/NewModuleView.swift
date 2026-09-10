import StorageDomain
import SwiftUI

struct NewModuleView: View {
    @Environment(\.dismiss) var dismiss

    @State private var viewModel: NewModuleViewModel = .init()
    @State private var itemToAdd: String = ""

    var body: some View {
        NavigationStack {
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
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        Task { @MainActor in
                            await viewModel.save()
                            dismiss()
                        }
                    } label: {
                        Image(systemName: "checkmark")
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
    NewModuleView()
}
