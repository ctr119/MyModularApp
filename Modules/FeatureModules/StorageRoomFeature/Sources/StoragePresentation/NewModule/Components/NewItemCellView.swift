import SwiftUI

struct NewItemCellView: View {
    @FocusState private var isTagTextFieldFocused
    @State private var isTagMode = false
    @State private var tagToAdd = ""

    @Binding var item: NewItem
    let didTapRemove: (_ itemName: String) -> Void

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                leadingSide

                Spacer()

                removeButton
            }

            tagsView
        }
        .monospaced()
    }

    private var leadingSide: some View {
        HStack(spacing: 10) {
            Text(item.name)

            if isTagMode {
                TextField(
                    "",
                    text: $tagToAdd,
                    prompt: Text("Tag your item...")
                        .monospaced()
                )
                .focused($isTagTextFieldFocused)
                .transition(.blurReplace)
                .onSubmit {
                    defer {
                        withAnimation {
                            isTagMode.toggle()
                            isTagTextFieldFocused.toggle()
                        }
                    }

                    guard !item.tags.contains(tagToAdd),
                          !tagToAdd.isEmpty else {
                        return
                    }
                    item.tags.append(tagToAdd)
                    tagToAdd = ""
                }

            } else {
                Button {
                    withAnimation {
                        isTagMode.toggle()
                        isTagTextFieldFocused.toggle()
                    }
                } label: {
                    Text("add tag")
                        .font(
                            .callout.lowercaseSmallCaps()
                        )
                        .padding(.horizontal, 6)
                        .padding(.vertical, 1)
                        .background(.gray.opacity(0.3))
                        .clipShape(
                            RoundedRectangle(cornerRadius: 4)
                        )
                }
                .buttonStyle(.plain)
            }
        }
    }

    private var removeButton: some View {
        Button {
            withAnimation {
                didTapRemove(item.name)
            }
        } label: {
            Image(systemName: "xmark")
        }
        .buttonStyle(.plain)
    }

    @ViewBuilder
    private var tagsView: some View {
        if !item.tags.isEmpty {
            FlowLayout(spacing: 10) {
                ForEach(item.tags, id: \.self) {
                    ItemTagView(tag: $0)
                }
            }
            .transition(.opacity)
        }
    }
}

#Preview {
    @Previewable @State
    var item = NewItem(name: "Pots", tags: [])

    NewItemCellView(
        item: $item,
        didTapRemove: { _ in }
    )
}
