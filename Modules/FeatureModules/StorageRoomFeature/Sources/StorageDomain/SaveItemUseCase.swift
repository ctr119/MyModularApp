import Foundation

public protocol SaveItemUseCase: Sendable {
    func save<T, P>(item: T, in parent: P?) async
}

extension SaveItemUseCase {
    public func save<T, P>(item: T, in parent: P? = nil) async {
        await save(item: item, in: parent)
    }
}
