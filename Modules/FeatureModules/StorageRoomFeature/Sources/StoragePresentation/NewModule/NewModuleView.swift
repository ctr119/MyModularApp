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
}

#Preview {
    NewModuleView()
}
