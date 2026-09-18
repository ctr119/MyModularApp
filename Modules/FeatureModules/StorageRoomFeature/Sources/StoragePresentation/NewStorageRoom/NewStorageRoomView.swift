import DesignSystem
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
                )
                .dsTextStyle(.bodyLarge)

                Section {
                    dimensionsSection
                } header: {
                    Text("Dimensions")
                        .dsTextStyle(.subTitle)
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
                    .tint(color: .accent(.secondary))
                }

                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                    .tint(color: .accent(.secondary))
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
                .dsTextStyle(
                    .bodyMedium,
                    color: .text(.secondary)
                )
        }

        LabeledContent {
            TextField(
                "",
                value: $viewModel.cols,
                format: .number
            )
            .dsTextStyle(.callout)
        } label: {
            Text("How many units wide?")
                .dsTextStyle(
                    .bodyMedium,
                    color: .text(.secondary)
                )
        }
        .labeledContentStyle(.vertical)

        LabeledContent {
            TextField(
                "",
                value: $viewModel.rows,
                format: .number
            )
            .dsTextStyle(.callout)
        } label: {
            Text("How many units long?")
                .dsTextStyle(
                    .bodyMedium,
                    color: .text(.secondary)
                )
        }
        .labeledContentStyle(.vertical)
    }
}

#Preview {
    ThemedPreview(theme: .light) {
        NewStorageRoomView(
            dependencies: .mock()
        )
    }
}
