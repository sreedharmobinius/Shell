import Foundation
import Alamofire

class RestAPIManager {
    
    static var shared: RestAPIManager = RestAPIManager()
    
    private func getHeaders(forToken token: String) -> HTTPHeaders {
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "Authorization": "Bearer \(token)"
        ]

        return headers
    }
    
    func executeRequest(apiUrl: String, method: HTTPMethod, parameters: Parameters? = nil, onCompletion: @escaping (AFDataResponse<Any>) -> ()) {
        let headers = getHeaders(forToken: "")
        AF.request(
            apiUrl,
            method: .get,
            parameters: parameters,
            headers: headers
            ).responseJSON { request in
                onCompletion(request)
        }
    }
}
