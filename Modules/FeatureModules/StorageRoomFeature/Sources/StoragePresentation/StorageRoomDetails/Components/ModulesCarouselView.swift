import StorageDomain
import SwiftUI

struct ModulesCarouselView: View {
    @State private var targetModuleOpacity: CGFloat = 0.1

    let modules: [Module]
    let targetModule: Module?
    let didTapSeeAll: () -> Void

    var body: some View {
        VStack(alignment: .leading) {
            header
                .padding(.bottom, 6)

            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 6) {
                        ForEach(modules, id: \.id) { module in
                            carouselCell(module)
                                .id(module.id)
                        }
                    }
                }
                .task {
                    await revealTargetModule(using: proxy)
                }
            }
        }
    }

    @MainActor
    private func revealTargetModule(using proxy: ScrollViewProxy) async {
        guard let targetModule else { return }

        /// The scroll view needs one layout pass before it can resolve
        /// `scrollTo`, otherwise it jumps to the target unanimated.
        try? await Task.sleep(for: .milliseconds(16))

        withAnimation(
            .bouncy(duration: 0.55),
            completionCriteria: .removed,
            {
                proxy.scrollTo(targetModule.id, anchor: .center)
            },
            completion: {
                withAnimation(
                    .easeInOut(duration: 0.33)
                    .delay(0.55),
                    completionCriteria: .logicallyComplete,
                    {
                        targetModuleOpacity = 0.3
                    },
                    completion: {
                        withAnimation(.easeInOut(duration: 0.33)) {
                            targetModuleOpacity = 0.1
                        }
                    }
                )
            }
        )
    }

    private var header: some View {
        HStack {
            Label {
                Text("Modules")
            } icon: {
                Image(systemName: "shippingbox.fill")
                    .foregroundStyle(.brown)
            }

            Spacer()

            Button {
                didTapSeeAll()
            } label: {
                HStack {
                    Text("See all")
                    Image(systemName: "chevron.right")
                }
            }
            .buttonStyle(.plain)
        }
        .monospaced()
    }

    private func carouselCell(_ module: Module) -> some View {
        Button {
            // TODO: Navigate to Module details view
        } label: {
            Text(module.label)
                .monospaced()
                .padding(12)
                .padding(.horizontal, 6)
                .background(.black.opacity(
                    module == targetModule ? targetModuleOpacity : 0.1
                ))
                .clipShape(Capsule())
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ModulesCarouselView(
        modules: StorageRoom.mock.modules,
        targetModule: nil,
        didTapSeeAll: {}
    )
}
