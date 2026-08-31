import Foundation
import StorageDomain

final class GetStorageRoomsUseCaseMock: GetStorageRoomsUseCase {
    func callAsFunction() async -> [StorageRoom] {
        [.mock, .mock]
    }
}
