import Foundation

public protocol SaveItemUseCase: Sendable {
    func save<T, P>(item: T, in parent: P?) async
}

extension SaveItemUseCase {
    public func save<T>(item: T) async {
        let aux: Int? = nil
        await save(item: item, in: aux)
    }
}
