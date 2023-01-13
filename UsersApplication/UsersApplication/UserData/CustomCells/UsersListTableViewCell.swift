

import UIKit
import SDWebImage
class UsersListTableViewCell: UITableViewCell {
    static var cellIdentifier = "UsersListTableViewCell"
    static let nib =  UINib(nibName: "UsersListTableViewCell", bundle: nil)
    
    @IBOutlet weak var coverView: UIView!
    @IBOutlet weak var imageCoverView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var phoneLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        imageCoverView.setBorder(width: 1.0,color: .borderColor)
        imageCoverView.setRoundedCorner(radius: self.imageCoverView.frame.height/2)
        coverView.setBorder(width: 1.0,color: .borderColor)
        coverView.setRoundedCorner(radius: 8.0)
    }
    func customiseCellWithData(model: Users) {
        imgView.sd_setImage(with: URL(string:model.image ?? ""), placeholderImage: UIImage(named: "image"))
        
       
        phoneLbl.text = model.phone
        emailLbl.text = model.email
        usernameLbl.text = "\(model.firstName ?? "") \(model.lastName ?? "")"
    }
    
}
