import Foundation

actor TokenStore {
    static let shared = TokenStore()

    private var accessToken: String?

    private var refreshDelegate: TokenRefreshDelegate?
    private var refreshTask: Task<String, Error>?

    private init() {}

    func getAccessToken() async throws -> String? {
        if let refreshTask {
            return try await refreshTask.value
        }
        return accessToken
    }

    func refreshToken() async throws {
        if let refreshTask {
            _ = try await refreshTask.value
            return
        }

        guard let refreshDelegate else {
            throw NetworkError.missingTokenRefreshDelegate
        }

        let task = Task<String, Error> {
            return try await refreshDelegate.refresh()
        }
        self.refreshTask = task
        defer { refreshTask = nil }

        do {
            let newAccessToken = try await task.value
            self.accessToken = newAccessToken
        } catch {
            self.accessToken = nil
            throw error
        }
    }
}

extension TokenStore: NetworkTokenStore {
    public func setAccessToken(_ token: String) async throws {
        if let refreshTask {
            _ = try await refreshTask.value
            return
        }
        self.accessToken = token
    }

    func setRefreshDelegate(_ delegate: any TokenRefreshDelegate) async {
        self.refreshDelegate = delegate
    }
}
