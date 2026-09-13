import Foundation

public protocol DeleteItemUseCase: Sendable {
    func delete<T>(item: T) async
}
