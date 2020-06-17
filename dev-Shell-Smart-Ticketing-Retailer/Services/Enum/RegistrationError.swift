import Foundation
enum RegistrationError: Error {
    case invalidEmail
    case invalidPassword
}

extension RegistrationError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidEmail:
            return NSLocalizedString("Invalid email description here", comment: "Invalid Email")
        case .invalidPassword:
            return NSLocalizedString("Invalid password", comment: "Invalid Password")
        }
    }
}
