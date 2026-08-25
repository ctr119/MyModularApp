import Foundation
import Security

public enum KeychainSingleton {
    public static let shared: Keychain = KeychainStore.shared
}
