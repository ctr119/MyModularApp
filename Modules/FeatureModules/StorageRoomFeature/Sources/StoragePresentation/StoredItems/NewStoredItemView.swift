import StorageDomain
import SwiftUI

enum NewItemError: Error {
    case cancelledByUser
}

struct NewStoredItemView: View {
    @Environment(\.dismiss) var dismiss

    @State private var viewModel: NewStoredItemViewModel = .init()
    @State private var tagToAdd = ""

    var body: some View {
        NavigationStack {
            List {
                TextField(
                    "",
                    text: $viewModel.itemName,
                    prompt: Text("Type your item...")
                        .monospaced()
                )

                Section {
                    TextField(
                        "",
                        text: $tagToAdd,
                        prompt: Text("Add a tag...")
                            .monospaced()
                    )
                    .onSubmit(of: .text) {
                        defer {
                            tagToAdd = ""
                        }
                        viewModel.add(tag: tagToAdd)
                    }

                    FlowLayout(spacing: 10) {
                        ForEach(viewModel.tags, id: \.self) {
                            ItemTagView(tag: $0)
                        }
                    }
                } header: {
                    Text("Tags")
                        .font(.callout.monospaced())
                }

            }
            .navigationTitle("New item")
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
    NewStoredItemView()
}
