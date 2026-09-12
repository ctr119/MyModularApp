import Foundation
import StorageDomain

public class StorageRoomDetailsDependencies {
    static func mock() -> StorageRoomDetailsDependencies {
        .init(
            getStorageRoomDetailsUseCase: GetStorageRoomDetailsUseCaseMock()
        )
    }

    let getStorageRoomDetailsUseCase: GetStorageRoomDetailsUseCase

    public init(getStorageRoomDetailsUseCase: GetStorageRoomDetailsUseCase) {
        self.getStorageRoomDetailsUseCase = getStorageRoomDetailsUseCase
    }
}
