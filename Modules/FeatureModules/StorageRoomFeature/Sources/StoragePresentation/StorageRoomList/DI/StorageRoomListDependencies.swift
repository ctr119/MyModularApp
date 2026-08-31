import Foundation
import StorageDomain

public final class StorageRoomListDependencies {
    let getStorageRoomsUseCase: GetStorageRoomsUseCase

    public init(getStorageRoomsUseCase: GetStorageRoomsUseCase) {
        self.getStorageRoomsUseCase = getStorageRoomsUseCase
    }
}
