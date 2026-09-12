import Foundation

public protocol GetStorageRoomDetailsUseCase: Sendable {
    func callAsFunction(_ id: UUID) async -> StorageRoom?
}
