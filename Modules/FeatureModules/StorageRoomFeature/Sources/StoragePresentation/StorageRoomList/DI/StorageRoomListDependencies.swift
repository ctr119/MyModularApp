import Foundation
import StorageDomain

public final class StorageRoomListDependencies {
    static func mock() -> StorageRoomListDependencies {
        .init(
            getStorageRoomsUseCase: GetStorageRoomsUseCaseMock()
        )
    }

    let getStorageRoomsUseCase: GetStorageRoomsUseCase

    public init(getStorageRoomsUseCase: GetStorageRoomsUseCase) {
        self.getStorageRoomsUseCase = getStorageRoomsUseCase
    }
}
