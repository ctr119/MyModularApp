import StorageDomain
import SwiftUI

struct ModulesCarouselView: View {
    let modules: [Module]
    let didTapSeeAll: () -> Void

    var body: some View {
        VStack(alignment: .leading) {
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
            .padding(.bottom, 6)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 6) {
                    ForEach(modules, id: \.id) { module in
                        Button {

                        } label: {
                            Text(module.label)
                                .monospaced()
                                .padding(12)
                                .padding(.horizontal, 6)
                                .background(.black.opacity(0.1))
                                .clipShape(Capsule())
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
    }
}

#Preview {
    ModulesCarouselView(
        modules: StorageRoom.mock.modules,
        didTapSeeAll: {}
    )
}
