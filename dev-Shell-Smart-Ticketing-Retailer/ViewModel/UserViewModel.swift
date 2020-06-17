import Foundation
class UserViewModel {
   
    var users:[User]? = [] {
        didSet {
            reloadTableView()
        }
    }
    var loginRestManager: LoginRestManager = LoginRestManager()
    var reloadTableView = {() -> () in}
    
    init() {
        getUsers()
    }
    
    func getUsers() {
        loginRestManager.getUserList { (result) in
            switch result {
            case .success(let users):
                self.users = users
                break;
            case .failure( _):
                //Do you work with error
                break;
            }
        }
    }
    
    //User below methods to get number of row and get value object for user at particular index
    func getNumberOfRow() -> Int {
        guard let users = self.users else {
            return 0
        }
        return users.count
    }
    
    func getUser(at index:Int) -> User? {
        guard let users = self.users else {
            return nil
        }
        return users[index]
    }
}

