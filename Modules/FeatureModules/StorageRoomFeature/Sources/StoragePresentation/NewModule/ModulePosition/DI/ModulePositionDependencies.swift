import Foundation
import StorageDomain

public class ModulePositionDependencies {
    static func mock() -> ModulePositionDependencies {
        .init(saveItemUseCase: SaveItemUseCaseMock())
    }

    let saveItemUseCase: SaveItemUseCase

    public init(saveItemUseCase: SaveItemUseCase) {
        self.saveItemUseCase = saveItemUseCase
    }
}
