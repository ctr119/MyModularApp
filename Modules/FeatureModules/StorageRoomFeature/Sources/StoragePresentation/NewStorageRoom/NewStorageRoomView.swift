import StorageDomain
import SwiftUI

struct NewStorageRoomView: View {
    @Environment(\.dismiss) var dismiss

    @State private var viewModel: NewStorageRoomViewModel

    init(dependencies: NewStorageRoomDependencies) {
        self._viewModel = State(
            wrappedValue: NewStorageRoomViewModel(
                dependencies: dependencies
            )
        )
    }

    var body: some View {
        NavigationStack {
            List {
                TextField(
                    "",
                    text: $viewModel.roomName,
                    prompt: Text("Name the room...")
                        .monospaced()
                )

                Section {
                    dimensionsSection
                } header: {
                    Text("Dimensions")
                        .monospaced()
                }
            }
            .navigationTitle("Add new room")
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

    @ViewBuilder
    private var dimensionsSection: some View {
        LabeledContent {
            MeasureInput(
                measure: $viewModel.cellSize.amount,
                unit: $viewModel.cellSize.unit,
                promptText: "Enter the size for each cell..."
            )
        } label: {
            Text("Specify the unit measure...")
                .monospaced()
                .foregroundStyle(.gray.opacity(0.8))
        }

        LabeledContent {
            TextField(
                "",
                value: $viewModel.rows,
                format: .number
            )
        } label: {
            Text("How many units wide?")
                .monospaced()
                .foregroundStyle(.gray.opacity(0.8))
        }
        .labeledContentStyle(.vertical)

        LabeledContent {
            TextField(
                "",
                value: $viewModel.cols,
                format: .number
            )
        } label: {
            Text("How many units long?")
                .monospaced()
                .foregroundStyle(.gray.opacity(0.8))
        }
        .labeledContentStyle(.vertical)
    }
}

#Preview {
    NewStorageRoomView(
        dependencies: .mock()
    )
}
