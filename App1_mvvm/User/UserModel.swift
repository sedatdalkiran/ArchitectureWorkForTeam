//
//  UserModel.swift
//  App1_mvvm
//
//  Created by SEDAT DALKIRAN on 6.07.2022.
//

import Foundation

struct UserModel: Decodable {
    let id: Int
    let name: String
    let username: String
    let email: String
}
