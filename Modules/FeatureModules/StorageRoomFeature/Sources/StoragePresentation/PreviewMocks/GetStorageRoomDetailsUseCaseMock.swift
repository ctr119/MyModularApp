import Foundation
import StorageDomain

final class GetStorageRoomDetailsUseCaseMock: GetStorageRoomDetailsUseCase {
    func callAsFunction(_ id: UUID) -> StorageRoom? {
        .mock
    }
}
