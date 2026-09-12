import Foundation
import StorageDomain

final class GetModuleDetailsUseCaseMock: GetModuleDetailsUseCase {
    func callAsFunction(id: UUID) async -> Module? {
        StorageRoom.mock.modules.first!
    }
}
