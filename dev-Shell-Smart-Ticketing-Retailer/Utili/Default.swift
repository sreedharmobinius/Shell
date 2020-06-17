import Foundation

class DefaultManager {
    
    static let shared : DefaultManager = {
        let instance = DefaultManager()
        return instance
    }()
    
    
     func setValue(v:Any,k:String) {
        UserDefaults.standard.set(v, forKey: k)
        UserDefaults.standard.synchronize()
     }
    
     func getValue(getValueFor key:String) -> Any? {
        if let value = UserDefaults.standard.value(forKey: key) {
            return value
        }
        else {
            return nil
        }
    }
    
    func clearDefault(for key:String){
        UserDefaults.standard.removeObject(forKey: key)
    }
}

public struct UtilDefaultKeys {
    static let isAppLaunched    = "isAppLaunched"
    static let accessToken     = "accesstoken"
    static let refreshToken     = "refreshToken"
}
