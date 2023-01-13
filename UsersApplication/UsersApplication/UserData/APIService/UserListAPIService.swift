

import Foundation
protocol UserListAPIService {
    func perform(route:UserListRouter, success:@escaping (Any)->Void, failure:@escaping (Any?)->Void)
  
}
