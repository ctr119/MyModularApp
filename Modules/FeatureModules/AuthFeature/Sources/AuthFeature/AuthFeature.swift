import Foundation
import NetworkKit

public final class AuthTokenRefresher: TokenRefresherProtocol {
    public init() {}

    public func refresh() async throws -> String {
        try await Task.sleep(nanoseconds: 500_000_000)
        let token = "refreshed_\(UUID().uuidString)"

        UserDefaults.standard.set(token, forKey: "access_token")
        return token
    }
}

public final class LoginUseCase {
    public init() {}

    public func execute() async throws {
        try await Task.sleep(nanoseconds: 500_000_000)
        let token = "new_login_token"
        UserDefaults.standard.set(token, forKey: "access_token")
//        await TokenProvider.shared.updateAccessToken(token)
    }
}
