import Foundation
import Security

public enum KeychainError: Error {
    case duplicatedEntry
    case searchingFailed(OSStatus)
    case storingFailed(OSStatus)
}
