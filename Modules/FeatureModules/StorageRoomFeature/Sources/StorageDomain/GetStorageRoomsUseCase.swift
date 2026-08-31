import Foundation

public protocol GetStorageRoomsUseCase: Sendable {
    func callAsFunction() async -> [StorageRoom]
}
