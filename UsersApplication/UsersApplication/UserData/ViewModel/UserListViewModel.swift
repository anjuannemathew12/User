

import Foundation
class UserListViewModel: NSObject {
    var showhud: ((Bool) -> Void)?
    var reloadTable: (() -> Void)?
    var usersList: [Users] = []
    var totalCount: Int? = 0
    var skip = 0
    var isDataLoading = false
    func getUserList(skip: Int,success: @escaping ([Users]) -> Void,failure: @escaping (Any?) -> Void){
        showhud?(true)
        
        ServiceHolder.shared.userListAPIHandler.perform(route: .getUserList(limit: 10, skip: skip), success:{ (response) in
            
            self.showhud?(false)
            guard let resultValue = response as? [String:Any] else{
                failure(response)
                return
            }
            
            self.totalCount = resultValue["total"] as? Int
            guard let result = resultValue["users"] as? [[String:Any]] else{
                failure(response)
                return
            }
            
            if result.count > 0 {
                do {
                    let jsonResp = try JSONSerialization.data(withJSONObject: result, options: [])
                    let userData = try JSONDecoder().decode([Users].self, from: jsonResp)
                    if self.isDataLoading {
                        self.usersList.append(contentsOf: userData)
                        self.isDataLoading = false
                    }else {
                        self.usersList = userData
                    }
                  
                    self.reloadTable?()
                    success(userData)
                } catch let parsingError {
                    failure(response)
                    print("Error", parsingError)
                }
                
            }
            else{
                failure(response)
            }
            
            
        }, failure: { (error) in
            self.showhud?(false)
            failure(error)
        })
        
    }
    func getUserDetails(id: Int,success: @escaping (Users) -> Void,failure: @escaping (Any?) -> Void){
        showhud?(true)
        
        ServiceHolder.shared.userListAPIHandler.perform(route: .getUserDetails(userId: id), success:{ (response) in
            
            self.showhud?(false)
            guard let resultValue = response as? [String:Any] else{
                failure(response)
                return
            }
            
            
           
            
            if resultValue.count > 0 {
                do {
                    let jsonResp = try JSONSerialization.data(withJSONObject: resultValue, options: [])
                    let userData = try JSONDecoder().decode(Users.self, from: jsonResp)
                    success(userData)
                } catch let parsingError {
                    failure(response)
                    print("Error", parsingError)
                }
                
            }
            else{
                failure(response)
            }
            
            
        }, failure: { (error) in
            self.showhud?(false)
            failure(error)
        })
        
    }
}
