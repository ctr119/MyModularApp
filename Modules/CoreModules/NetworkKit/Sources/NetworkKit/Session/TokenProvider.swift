import Foundation

public actor TokenProvider {
    public static let shared = TokenProvider()

    private var accessToken: String?

    private var refresher: TokenRefresherProtocol?
    private var refreshTask: Task<String, Error>?
    
    private init() {}
    
    public func configure(refresher: TokenRefresherProtocol) {
        self.refresher = refresher
    }

    func setAccessToken(_ token: String?) {
        self.accessToken = token
    }

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

        guard let refresher = refresher else {
            throw NSError(domain: "Session", code: 401)
        }

        let task = Task<String, Error> {
            return try await refresher.refresh()
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
