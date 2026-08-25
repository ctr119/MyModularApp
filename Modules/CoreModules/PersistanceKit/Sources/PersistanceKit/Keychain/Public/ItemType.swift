import Foundation
import Security

public enum ItemType {
    case password

    var toSecurity: CFString {
        switch self {
        case .password:
            kSecClassGenericPassword
        }
    }
}
