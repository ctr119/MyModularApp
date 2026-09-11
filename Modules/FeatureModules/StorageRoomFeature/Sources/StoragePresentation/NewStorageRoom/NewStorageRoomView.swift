import StorageDomain
import SwiftUI

struct NewStorageRoomView: View {
    @Environment(\.dismiss) var dismiss

    @State private var roomName: String = ""
    @State private var cellSizeAmount: Decimal = 1
    @State private var cellSizeUnit: Measure.Unit = .m
    @State private var rows: Int = 1
    @State private var cols: Int = 1

    var body: some View {
        NavigationStack {
            List {
                TextField(
                    "",
                    text: $roomName,
                    prompt: Text("Name the room...")
                        .monospaced()
                )

                Section {
                    dimensionsSection
                } header: {
                    Text("Dimensions")
                }
            }
            .navigationTitle("Add new room")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {

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
                measure: $cellSizeAmount,
                unit: $cellSizeUnit,
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
                value: $rows,
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
                value: $cols,
                format: .number
            )
        } label: {
            Text("How many units long?")
                .monospaced()
                .foregroundStyle(.gray.opacity(0.8))
        }
        .labeledContentStyle(.vertical)
    }

    private func save() {
//        StorageRoom(
//            id: UUID,
//            name: String,
//            cellSize: Measure,
//            gridRows: Int,
//            gridCols: Int,
//            modules: [Module]
//        )
    }
}

#Preview {
    NewStorageRoomView()
}
