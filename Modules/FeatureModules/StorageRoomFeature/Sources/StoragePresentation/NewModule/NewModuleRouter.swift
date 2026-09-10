import SwiftUI
import StorageDomain

@Observable
final class NewModuleRouter {
    enum Destination: Hashable {
        case positionStep(_ room: StorageRoom)
    }

    var path: [Destination] = []

    func navigate(to destination: Destination) {
        path.append(destination)
    }

    @ViewBuilder
    func view(for destination: Destination) -> some View {
        switch destination {
        case .positionStep(let room):
            // TODO: Build this screen/step
            Text("The room")
        }
    }
}
