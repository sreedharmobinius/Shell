import Foundation

class Logger {
    public static func log(with message: String) {
        #if DEBUG
            print("SHELL - \(message)")
        #endif
    }
}
