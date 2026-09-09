import Foundation
import StorageDomain

public final class NewStoredItemDependencies {
    static func mock() -> NewStoredItemDependencies {
        .init(
            saveItemUseCase: SaveItemUseCaseMock()
        )
    }

    let saveItemUseCase: SaveItemUseCase

    public init(saveItemUseCase: SaveItemUseCase) {
        self.saveItemUseCase = saveItemUseCase
    }
}
