import SwiftUI

struct NewModuleView: View {
    @Environment(\.dismiss) var dismiss

    @State private var moduleName: String = ""
    @State private var itemToAdd: String = ""
    @State private var newItems: [String] = [
        "Roomba",
        "Pots",
        "Iron Pans"
    ]

    var body: some View {
        NavigationStack {
            List {
                TextField(
                    "",
                    text: $moduleName,
                    prompt: Text("Label your package...")
                        .monospaced()
                )

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
                        // TODO: VM add
                        newItems.append(itemToAdd)
                    }

                    if !newItems.isEmpty {
                        ForEach(newItems, id: \.self) {
                            Text($0)
                                .monospaced()
                        }
                    }
                } header: {
                    Text("Items")
                        .font(.callout.monospaced())
                }
            }
            .navigationTitle("New module")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        Task { @MainActor in
                            // TODO: await viewModel.save()
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
}

#Preview {
    NewModuleView()
}
