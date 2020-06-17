import Foundation
import Alamofire

class LoginRestManager {
    
    func getUserList(onCompletion: @escaping (Result<[User], CustomError>) -> ()) {
        let url = RestConstants.BASE_URL + RestConstants.API_ENDPOINT_GET_USER_LIST
        RestAPIManager.shared.executeRequest(apiUrl: url, method: .get) { (request) in
            guard let statusCode = request.response?.statusCode else {
                onCompletion(.failure(CustomError.NoDataFound))
                return
            }
            
            switch statusCode {
            case RestConstants.HTTP_CODE_OK:
                guard let data = request.data else {
                    // handle errors here
                    onCompletion(.failure(CustomError.NoDataFound))
                    return
                }
                let decoder = JSONDecoder()
                do {
                    let users = try decoder.decode([User].self, from: data)
                    onCompletion(.success(users))
                } catch {
                    onCompletion(.failure(CustomError.ParsingError))
                }
            default:
                onCompletion(.failure(.NoDataFound))
            }
        }
    }
    
    
    func loginUser(param: Parameters,  onCompletion: @escaping (Result<[Any], CustomError>) -> ()) {
        
        //Use like below if you want to create format
        /*let urlPattern = RestConstants.BASE_URL + RestConstants.API_ENDPOINT_GET_WORK_ORDERS
        let urlAPI = String(format: urlPattern,AnyID here)*/
        
        let urlAPI = RestConstants.BASE_URL + RestConstants.API_ENDPOINT_LOGIN_USER
        
        RestAPIManager.shared.executeRequest(apiUrl: urlAPI,method: .get, parameters: param) { [weak self](request) in
            guard let `self` = self else { return }
            
            switch request.result {
            case .success:
                if request.response?.statusCode == RestConstants.HTTP_CODE_OK {
                    // Do your work here if success
                }
                
            case .failure(let error):
                //Return you error here
                break;
            }
        }
    }
}

