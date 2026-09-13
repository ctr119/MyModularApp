import StorageDomain
import SwiftUI

public struct NewStoredItemView: View {
    @Environment(\.dismiss) var dismiss

    @State private var viewModel: NewStoredItemViewModel
    @State private var tagToAdd = ""

    public init(
        for module: Module,
        dependencies: NewStoredItemDependencies
    ) {
        _viewModel = State(
            wrappedValue: NewStoredItemViewModel(
                module: module,
                dependencies: dependencies
            )
        )
    }

    public var body: some View {
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
                        Image(systemName: "xmark")
                    }
                }
            }
        }
    }
}

#Preview {
    NewStoredItemView(
        for: StorageRoom.mock.modules.first!,
        dependencies: .mock()
    )
}
