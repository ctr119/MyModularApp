import Foundation
import Security

public protocol Keychain: Actor {
    func store<T: Encodable>(_ element: T, withKey key: String, type: ItemType) throws
    func search<T: Decodable>(elementKey key: String, type: ItemType) throws -> T
}

public extension Keychain {
    func store<T: Encodable>(_ element: T, withKey key: String, type: ItemType = .password) throws {
        try store(element, withKey: key, type: type)
    }

    func search<T: Decodable>(elementKey key: String, type: ItemType = .password) throws -> T {
        try search(elementKey: key, type: type)
    }
}
