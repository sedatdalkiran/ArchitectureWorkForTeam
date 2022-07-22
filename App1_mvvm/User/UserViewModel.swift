//
//  UserViewModel.swift
//  App1_mvvm
//
//  Created by SEDAT DALKIRAN on 6.07.2022.
//

import Foundation

protocol UserListViewModelDelegate: AnyObject {
    func userLoaded(userList: [UserModel])
}

class UserListViewModel {
    private var userList: [UserModel] = []
    
    weak var delegate: UserListViewModelDelegate? //viewmodel to vc
    
//    func numberOfRowsInSection() -> Int {
//        return self.userList.count
//    }
//
//    func userAtIndex(_ index: Int) -> UserModel {
//            return self.userList[index]
//        }
    
    func loadUser() {
        let apiUrl = URL(string: "https://jsonplaceholder.typicode.com/users")
        let session = URLSession.shared.dataTask(with: URLRequest(url: apiUrl!)) { (data, response, error) in
            if let httpResponse = response as? HTTPURLResponse {
                if(httpResponse.statusCode != 200) {
                    print("error in loadUser")
                }
            }
            if let myData = data, let users = try? JSONDecoder().decode([UserModel].self, from: myData) {
                self.userList = users
                DispatchQueue.main.async {
                    self.delegate?.userLoaded(userList: users)
                }
            }
        }
        session.resume()
    }
}
