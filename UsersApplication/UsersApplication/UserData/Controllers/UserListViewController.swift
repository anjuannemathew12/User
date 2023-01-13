

import UIKit

class UserListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let viewModel = UserListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModelClosures()
        self.getUserList()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UsersListTableViewCell.nib, forCellReuseIdentifier: UsersListTableViewCell.cellIdentifier)
    }

    func getUserList() {
        viewModel.getUserList(skip: 0, success: { response in
            
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
extension UserListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.usersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UsersListTableViewCell.cellIdentifier , for: indexPath) as! UsersListTableViewCell
        cell.customiseCellWithData(model: viewModel.usersList[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "UserDetailsViewController") as! UserDetailsViewController
        detailsVC.userId = viewModel.usersList[indexPath.row].id
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if viewModel.usersList.count < viewModel.totalCount ?? 0 {
            if ((self.tableView.contentOffset.y + self.tableView.frame.size.height) >= self.tableView.contentSize.height) {
                if !(viewModel.isDataLoading){
                    viewModel.skip = viewModel.usersList.count
                    viewModel.isDataLoading = true
                    viewModel.getUserList(skip: viewModel.skip, success: { response in
                        
                    }, failure: { error in
                        if let errorMsg = (error as? [String:Any])?["msg"] as? String {
                            self.showAlertMessage(title: AppMessages.errorTitle, message: errorMsg, okButtonTitle: AppMessages.Ok)
                        }
                    })
                    
                    
                    
                }
            }
            
            
        }else {
            Toast.show(message: "Yay! You have seen it all", controller: self)
        }
    }
    
}

