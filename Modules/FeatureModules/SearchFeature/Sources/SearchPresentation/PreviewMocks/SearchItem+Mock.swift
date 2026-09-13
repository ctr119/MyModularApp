import Foundation
import SearchDomain

extension SearchItem {
    static var mock: SearchItem {
        .init(
            item: .init(
                id: UUID(),
                name: "Pan"
            ),
            module: .init(
                id: UUID(),
                name: "Kitchen"
            ),
            room: .init(
                id: UUID(),
                name: "Basement"
            )
        )
    }

    static var mock2: SearchItem {
        .init(
            item: nil,
            module: .init(
                id: UUID(),
                name: "Bedroom"
            ),
            room: .init(
                id: UUID(),
                name: "Basement"
            )
        )
    }
}
