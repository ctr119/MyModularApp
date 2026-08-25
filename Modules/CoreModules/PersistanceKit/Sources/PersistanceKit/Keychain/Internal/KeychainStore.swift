import Foundation
import Security

final actor KeychainStore: Keychain {
    static let shared: Keychain = KeychainStore()
    private init() {}

    func store<T: Encodable>(_ element: T, withKey key: String, type: ItemType = .password) throws {
        let data = try JSONEncoder().encode(element)
        let query: [String: Any] = [
            kSecClass as String: type.toSecurity,
            kSecAttrAccount as String: key,
            kSecValueData as String: data,
            kSecAttrAccessible as String: kSecAttrAccessibleWhenUnlocked
        ]

        let status = SecItemAdd(query as CFDictionary, nil)

        guard status != errSecDuplicateItem else {
            throw KeychainError.duplicatedEntry
        }

        guard status == errSecSuccess else {
            throw KeychainError.storingFailed(status)
        }
    }

    func search<T: Decodable>(elementKey key: String, type: ItemType = .password) throws -> T {
        let query: [String: Any] = [
            kSecClass as String: type.toSecurity,
            kSecAttrAccount as String: key,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)

        guard status == errSecSuccess,
              let data = dataTypeRef as? Data else {
            throw KeychainError.searchingFailed(status)
        }

        return try JSONDecoder().decode(T.self, from: data)
    }
}
