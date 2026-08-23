import Foundation
import HomeDomain
import NetworkKit

public final class HomeRepository: GetHomeFeedUseCaseProtocol {
    private let client: NetworkClient

    public init(client: NetworkClient) {
        self.client = client
    }

    public func execute() async throws -> [FeedItem] {
        return [
            FeedItem(id: "1", title: "Modular Architecture Item"),
            FeedItem(id: "2", title: "Concurrencia Segura")
        ]
    }
}
