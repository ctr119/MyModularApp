import Foundation
import StorageDomain

public class NewStorageRoomDependencies {
    static func mock() -> NewStorageRoomDependencies {
        .init(
            saveItemUseCase: SaveItemUseCaseMock()
        )
    }

    let saveItemUseCase: SaveItemUseCase

    public init(saveItemUseCase: SaveItemUseCase) {
        self.saveItemUseCase = saveItemUseCase
    }
}
