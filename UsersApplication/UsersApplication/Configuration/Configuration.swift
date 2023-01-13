
import UIKit

class Configuration: NSObject {
    
    static let shared = Configuration()
    
    var configuration = [String: Any]()
    
    override init() {
        
        let currentConfiguration = Bundle.main.infoDictionary!
        configuration = currentConfiguration
    }
}

extension Configuration {
    
    func apiEndpoint() -> String {
        return configuration["BaseUrl"] as! String
    }
    
    
}

