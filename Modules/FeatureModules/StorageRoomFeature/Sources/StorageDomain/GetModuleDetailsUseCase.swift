import Foundation

public protocol GetModuleDetailsUseCase: Sendable {
    func callAsFunction(id: UUID) async -> Module?
}
