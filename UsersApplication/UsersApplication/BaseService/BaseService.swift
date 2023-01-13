
import Foundation
import Alamofire
class BaseService {

    func
    performRequest(router: URLRequestConvertible, success: @escaping (Any) -> Void, failure: @escaping (Any?) -> Void) {
        if !Connectivity.isReachable() {
            failure(["error": Errors.Network.returnErrorMessage(forErrorCode: "NETWORK_NOT_REACHABLE")])
            return
        }
    
        AF.request(router).responseJSON { response in
           print(response)

            if !Connectivity.isReachable() {
                failure(["error": Errors.Network.returnErrorMessage(forErrorCode: "NETWORK_NOT_REACHABLE")])
                return
            }
            
            guard response.error == nil else {
                // got an error in getting the data, need to handle it
                
                if response.response?.statusCode == 401 {
                   
                    self.performRequest(router: router, success: { (response) in
                    
                        success(response)
                    }, failure: { (error) in
                       failure(error)
                    })
                    
                
                    
                    
                    
                }
                else{
                    let error = response.error!

                    if error._code == NSURLErrorTimedOut {
                        let timeoutError = ["error": Errors.General.returnErrorMessage(forErrorCode: "TIMEOUT_ERROR")] as [String: Any]
                        failure(timeoutError)
                        return
                    }
                    failure(error)
                   
                }
                
                
                
              return
            }
            
            guard let json = response.value else {

                let error = ["error": Errors.General.returnErrorMessage(forErrorCode: "UNKNOWN_ERROR")] as [String: Any]

                failure(error)
                return
            }
            


            

            
            
          
            success(json)
        }
    }
    


   
    
    
  
    
}

