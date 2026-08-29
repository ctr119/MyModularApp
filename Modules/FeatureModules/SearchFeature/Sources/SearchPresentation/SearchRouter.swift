import SwiftUI

public enum SearchNavigationEvent: Hashable {
    case resultTapped(id: Int)
}

@Observable
class SearchRouter<Content: View> {
    var path: NavigationPath = .init()
    let navigationEventHandler: (SearchNavigationEvent) -> Content

    init(@ViewBuilder navigationEventHandler: @escaping (SearchNavigationEvent) -> Content) {
        self.navigationEventHandler = navigationEventHandler
    }

    func handle(event: SearchNavigationEvent) {
        path.append(event)
    }

    @ViewBuilder
    func view(for event: SearchNavigationEvent) -> some View {
        navigationEventHandler(event)
    }
}
