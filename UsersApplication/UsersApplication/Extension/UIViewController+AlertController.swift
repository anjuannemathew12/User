

import UIKit
extension UIViewController {
    
    func showAlertMessage(title: String?, message: String?, okButtonTitle: String?) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: okButtonTitle, style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }


}
