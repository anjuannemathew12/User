
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let viewModel = UserListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModelClosures()
        self.getUserList(skip: 0)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UsersListTableViewCell.nib, forCellReuseIdentifier: UsersListTableViewCell.cellIdentifier)
    }

    func getUserList(skip: Int) {
        viewModel.getUserList(skip: skip, success: { response in
            
        }, failure: { error in
            if let errorMsg = (error as? [String:Any])?["msg"] as? String {
                                           self.showAlertMessage(title: AppMessages.errorTitle, message: errorMsg, okButtonTitle: AppMessages.Ok)
                                                  }
        })
    }

    func viewModelClosures() {
        viewModel.showhud = { showhud in
            if showhud {
                self.view.showHud()
            }else {
                self.view.hideHud()
            }
            
        }
        viewModel.reloadTable = {
            self.tableView.reloadData()
        }
    }
}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.usersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UsersListTableViewCell.cellIdentifier , for: indexPath) as! UsersListTableViewCell
        cell.customiseCellWithData(model: viewModel.usersList[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

}
