import DataSourceBase
import Foundation
import SearchData
import SearchDomain
import SearchPresentation
import SwiftData
import SwiftUI

@MainActor
public enum SearchFeatureFactory<Content: View> {
    public static func make(
        searchText: Binding<String>,
        container: ModelContainer,
        @ViewBuilder navigationEventHandler: @escaping (SearchNavigationEvent) -> Content
    ) -> SearchView<Content> {
        let storageRoomDataSource = StorageRoomDataSourceFactory.make(container)
        let searchItemsUseCase = SearchRepositoryImpl(
            storageRoomDataSource: storageRoomDataSource
        )
        let searchDependencies = SearchDependencies(
            searchItemsUseCase: searchItemsUseCase
        )

        return SearchView(
            searchText: searchText,
            dependencies: searchDependencies,
            navigationEventHandler: navigationEventHandler
        )
    }
}
