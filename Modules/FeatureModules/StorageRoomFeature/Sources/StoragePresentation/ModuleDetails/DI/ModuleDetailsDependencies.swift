import Foundation
import StorageDomain

public final class ModuleDetailsDependencies {
    static func mock() -> ModuleDetailsDependencies {
        .init(
            getModuleDetailsUseCase: GetModuleDetailsUseCaseMock()
        )
    }

    let getModuleDetailsUseCase: GetModuleDetailsUseCase

    public init(getModuleDetailsUseCase: GetModuleDetailsUseCase) {
        self.getModuleDetailsUseCase = getModuleDetailsUseCase
    }
}
