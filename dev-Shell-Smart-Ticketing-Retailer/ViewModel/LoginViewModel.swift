import Foundation
import Alamofire

class LoginViewModel {
    let loginRestManager: LoginRestManager = LoginRestManager()
    
    init() {
    }
    
    func loginUser(with parameters: Parameters) {
        
    }
    
    func forgotPassword(with parameters: Parameters, onCompletion:@escaping(Result<Any,CustomError>) -> ()){
           loginRestManager.forgotPassword(param: parameters, onCompletion:  { (result) in
           switch  result {
           case .success( _):
               onCompletion(.success(result))
               break;
           case .failure( _):
               break;
               
           }
           
       })
       }
    
    
}

