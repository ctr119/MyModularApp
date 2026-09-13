import StorageDomain
import SwiftUI

@MainActor
@Observable
class ModuleDetailsViewModel {
    var module: Module

    private let getModuleDetails: GetModuleDetailsUseCase
    private let deleteItemUseCase: DeleteItemUseCase

    init(module: Module, dependencies: ModuleDetailsDependencies) {
        self.module = module
        self.getModuleDetails = dependencies.getModuleDetailsUseCase
        self.deleteItemUseCase = dependencies.deleteItemUseCase
    }

    func refreshDetails() async {
        guard let refreshedModule = await getModuleDetails(id: module.id) else {
            return
        }
        self.module = refreshedModule
    }

    func deleteModule() async {
        await deleteItemUseCase.delete(item: module)
    }
}
