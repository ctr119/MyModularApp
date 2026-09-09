import Foundation

struct NewItem: Identifiable, Equatable {
    var id: String { name }
    let name: String
    var tags: [String] = []
}
