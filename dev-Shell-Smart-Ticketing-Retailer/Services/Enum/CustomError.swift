import Foundation
enum CustomError: Error {
    
    case NoDataFound
    case NetworkError
    case ParsingError
}

extension CustomError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .NoDataFound:
            return NSLocalizedString("No data found alert", comment: "No data Found")
        case .NetworkError:
            return NSLocalizedString("Network error alert", comment: "Network error")
        case .ParsingError:
            return NSLocalizedString("", comment: "")
        }
    }
}
