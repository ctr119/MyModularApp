import Foundation

public protocol NetworkTokenStore: Actor {
    func setAccessToken(_ token: String) async throws
    func setRefreshDelegate(_ delegate: TokenRefreshDelegate) async
}

public enum NetworkTokenStoreFactory {
    public static func make() -> NetworkTokenStore {
        TokenStore.shared
    }
}
