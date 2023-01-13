
import Foundation
import Alamofire
class UserListAPIHandler: BaseService,UserListAPIService {
   
    func perform(route: UserListRouter, success: @escaping (Any) -> Void, failure: @escaping (Any?) -> Void) {
        
        performRequest(router: route, success: { (response:Any) in
            switch route {
            case .getUserList,.getUserDetails:
                success(response)
          
            }
            
        }) { (error:Any?) in
            failure(error)
        }
    }
}
enum UserListRouter: URLRequestConvertible {
   
    case getUserList(limit: Int,skip: Int)
    case getUserDetails(userId: Int)
    var method: HTTPMethod {
        switch self {
        case .getUserList,.getUserDetails:
            return .get
       
       
        }
    }
    var path: String {
        switch self {
        
        case .getUserList(let limit,let skip):
            return "https://dummyjson.com/users?limit=\(limit)&skip=\(skip)"
        case .getUserDetails(let userId):
            return "https://dummyjson.com/users/\(userId)"
            
            
        }
    }
//    var apiEndPoint: String {
//        return Configuration.shared.apiEndpoint()
//    }
  
    func asURLRequest() throws -> URLRequest {
        
        let urlString =  path
        
        let url = try urlString.asURL()
        print("Url....\(urlString)")
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .getUserList,.getUserDetails:
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: nil)
        }
        return urlRequest
    }
    
}

