

import UIKit
extension UIView {
   
    
    func setShadow(color:UIColor = .black, offset: CGSize = CGSize(width: 0.0, height: 5.0), radius: CGFloat = 2.0 , opacity: Float = 0.5){
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.masksToBounds = false
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity
    }
    

    func setRoundedCorner(radius: CGFloat) {
        
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    func setBorder(width: CGFloat = 1.0, color: UIColor, cornerRadius: CGFloat = 0.0)  {
        
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
        self.layer.cornerRadius = cornerRadius
    }
    
    
}

