

import UIKit

class UserDetailsViewController: UIViewController {
    
    @IBOutlet weak var genderLbl: UILabel!
    
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    
    @IBOutlet weak var addresslbl: UILabel!
    
    @IBOutlet weak var bloodgruopLbl: UILabel!
    @IBOutlet weak var dateOfBirthLbl: UILabel!
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var profilePicCoverView: UIView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var phoneLbl: UILabel!
    @IBOutlet weak var namelbl: UILabel!
    
    @IBOutlet weak var universityLbl: UILabel!
    @IBOutlet weak var hairTypeLbl: UILabel!
    @IBOutlet weak var hairColorLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    
    @IBOutlet weak var weightLbl: UILabel!
    
    @IBOutlet weak var eyecolorLbl: UILabel!
    
    @IBOutlet weak var cardExpirelbl: UILabel!
    
    @IBOutlet weak var cardNoLbl: UILabel!
    
    @IBOutlet weak var cardtypelbl: UILabel!
    @IBOutlet weak var currencylbl: UILabel!
    
    @IBOutlet weak var ibanLbl: UILabel!
    
    @IBOutlet weak var companyNameLbl: UILabel!
    
    @IBOutlet weak var designationlbl: UILabel!
    
    @IBOutlet weak var departmentlbl: UILabel!
    
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet  var coverViews: [UIView]!
    @IBOutlet var mianCoverView: [UIView]!
    let viewModel = UserListViewModel()
    var userId: Int? = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpViews()
        self.getUserList()
        // Do any additional setup after loading the view.
    }
    
    
    func getUserList() {
        viewModel.getUserDetails(id: userId ?? 0, success: { model in
            self.setupData(model: model)
        }, failure: { error in
            
        })
    }
    
    func setUpViews() {
        self.title = "USER DETAILS"
        let backButton = UIBarButtonItem()
        backButton.tintColor = UIColor.white
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        for view in coverViews {
            view.setBorder(width: 1.0, color: .borderColor)
            view.setRoundedCorner(radius: 5.0)
        }
        for view in mianCoverView {
            view.setBorder(width: 1.0, color: .borderColor)
            view.setRoundedCorner(radius: 8.0)
        }
        profilePicCoverView.setBorder(width: 1.0,color: .borderColor)
        profilePicCoverView.setRoundedCorner(radius: self.profilePicCoverView.frame.height/2)
    }

    func setupData(model: Users) {
        genderLbl.text = model.gender
        usernameLbl.text = model.username
        ageLbl.text = "\(model.age ?? 0)"
        addresslbl.text = "\(model.address?.address ?? ""), \(model.address?.city ?? "")"
        bloodgruopLbl.text = model.bloodGroup
        dateOfBirthLbl.text = model.birthDate
        profilePic.sd_setImage(with: URL(string:model.image ?? ""), placeholderImage: UIImage(named: "image"))
        emailLbl.text = model.email
        phoneLbl.text = model.phone
        namelbl.text = model.firstName
        universityLbl.text = model.university
        hairTypeLbl.text = model.hair?.type
        hairColorLbl.text = model.hair?.color
        heightLbl.text = "\(model.height ?? 0)"
        weightLbl.text = "\(model.weight ?? 0)"
        eyecolorLbl.text = model.eyeColor
        cardExpirelbl.text = model.bank?.cardExpire
        cardNoLbl.text = model.bank?.cardNumber
        cardtypelbl.text = model.bank?.cardType
        currencylbl.text = model.bank?.currency
        ibanLbl.text = model.bank?.iban
        companyNameLbl.text = model.company?.name
        designationlbl.text = model.company?.title
        departmentlbl.text = model.company?.department
        addressLbl.text = "\(model.company?.address?.address ?? ""), \(model.company?.address?.city ?? "")"
        
    }

}
