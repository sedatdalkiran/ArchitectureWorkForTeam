//
//  UserViewController.swift
//  App1_mvvm
//
//  Created by SEDAT DALKIRAN on 6.07.2022.
//

import UIKit

final class UserViewController: UIViewController {
    
    @IBOutlet weak var userTableView: UITableView!
    
    private var users: [UserModel] = []
    private var userListViewModel: UserListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userListViewModel = UserListViewModel()
        userTableView.delegate = self
        userTableView.dataSource = self
        userTableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserCell")
        self.userListViewModel?.loadUser()
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let index = sender as? Int, segue.identifier == "toUserDetailVC" {
//            let destination = segue.destination as! UserDetailViewController
//            let user = self.users[index]
//        }
//    }
}


extension UserViewController: UserListViewModelDelegate {
    func userLoaded(userList: [UserModel]) {
        self.users = userList
        self.userTableView.reloadData()
    }
}
extension UserViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toUserDetailVC", sender: indexPath.row)
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
}

extension UserViewController:  UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userTableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserTableViewCell
        let user = self.users[indexPath.row]
        cell.nameTxt.text = user.name
        cell.usernameTxt.text = user.username
        return cell
    }
}


