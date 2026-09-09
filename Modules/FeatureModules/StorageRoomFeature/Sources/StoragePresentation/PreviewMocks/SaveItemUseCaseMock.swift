import StorageDomain

final class SaveItemUseCaseMock: SaveItemUseCase {
    func save<T, P>(item: T, in parent: P?) async {}
}
