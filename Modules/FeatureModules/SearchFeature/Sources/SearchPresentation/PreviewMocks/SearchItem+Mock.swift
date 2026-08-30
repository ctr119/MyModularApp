import Foundation
import SearchDomain

extension SearchItem {
    static var mock: SearchItem {
        .init(
            id: UUID(),
            name: "Pan",
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
}
