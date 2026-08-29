import Foundation
import SearchPresentation
import SwiftUI

@MainActor
public enum SearchFeatureFactory<Content: View> {
    public static func make(
        searchText: Binding<String>,
        @ViewBuilder navigationEventHandler: @escaping (SearchNavigationEvent) -> Content
    ) -> SearchView<Content> {

        

        return SearchView(
            searchText: searchText,
            navigationEventHandler: navigationEventHandler
        )
    }
}
