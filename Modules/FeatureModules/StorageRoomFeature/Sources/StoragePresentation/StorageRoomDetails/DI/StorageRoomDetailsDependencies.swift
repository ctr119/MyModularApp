import Foundation
import StorageDomain

public class StorageRoomDetailsDependencies {
    static func mock() -> StorageRoomDetailsDependencies {
        .init(
            getStorageRoomDetailsUseCase: GetStorageRoomDetailsUseCaseMock(),
            deleteItemUseCase: DeleteItemUseCaseMock()
        )
    }

    let getStorageRoomDetailsUseCase: GetStorageRoomDetailsUseCase
    let deleteItemUseCase: DeleteItemUseCase

    public init(
        getStorageRoomDetailsUseCase: GetStorageRoomDetailsUseCase,
        deleteItemUseCase: DeleteItemUseCase
    ) {
        self.getStorageRoomDetailsUseCase = getStorageRoomDetailsUseCase
        self.deleteItemUseCase = deleteItemUseCase
    }
}
