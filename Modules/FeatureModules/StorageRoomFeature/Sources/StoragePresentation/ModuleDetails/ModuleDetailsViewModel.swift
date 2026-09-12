import StorageDomain
import SwiftUI

@MainActor
@Observable
class ModuleDetailsViewModel {
    var module: Module

    private let getModuleDetails: GetModuleDetailsUseCase

    init(module: Module, dependencies: ModuleDetailsDependencies) {
        self.module = module
        self.getModuleDetails = dependencies.getModuleDetailsUseCase
    }

    func refreshDetails() async {
        guard let refreshedModule = await getModuleDetails(id: module.id) else {
            return
        }
        self.module = refreshedModule
    }
}
