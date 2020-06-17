import Foundation
import Alamofire

//Use this method to get network connectivity
class Connectivity {
    class func isInternetAvailable() -> Bool {
        let reachabilityManager = NetworkReachabilityManager()
        return reachabilityManager?.isReachable ?? false
    }
}
