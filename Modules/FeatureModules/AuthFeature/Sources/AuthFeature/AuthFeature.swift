import Foundation
import NetworkKit
import PersistanceKit

public final class AuthTokenRefresher: TokenRefresherProtocol {
    private let accessTokenKey = "mmaat" // To the repo
    private let keychain: Keychain

    public init(keychain: Keychain = KeychainSingleton.shared) {
        self.keychain = keychain
    }

    public func refresh() async throws -> String {
        try await Task.sleep(nanoseconds: 500_000_000)
        let token = "refreshed_\(UUID().uuidString)"
        try await keychain.store(token, withKey: accessTokenKey)
        return token
    }
}

public final class LoginUseCase {
    private let accessTokenKey = "mmaat" // To the repo
    private let keychain: Keychain
    // TODO: Rename to NetworkTokenStore
    private let tokenProvider: TokenProvider

    public init(
        keychain: Keychain = KeychainSingleton.shared,
        tokenProvider: TokenProvider = .shared
    ) {
        self.keychain = keychain
        self.tokenProvider = tokenProvider
    }

    public func execute() async throws {
        try await Task.sleep(nanoseconds: 500_000_000)
        let token = "new_login_token"

        try await keychain.store(token, withKey: accessTokenKey)
        try await tokenProvider.setAccessToken(token)
    }
}
