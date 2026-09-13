import Foundation
import StorageDomain

public final class ModuleDetailsDependencies {
    static func mock() -> ModuleDetailsDependencies {
        .init(
            getModuleDetailsUseCase: GetModuleDetailsUseCaseMock(),
            deleteItemUseCase: DeleteItemUseCaseMock()
        )
    }

    let getModuleDetailsUseCase: GetModuleDetailsUseCase
    let deleteItemUseCase: DeleteItemUseCase

    public init(
        getModuleDetailsUseCase: GetModuleDetailsUseCase,
        deleteItemUseCase: DeleteItemUseCase
    ) {
        self.getModuleDetailsUseCase = getModuleDetailsUseCase
        self.deleteItemUseCase = deleteItemUseCase
    }
}
