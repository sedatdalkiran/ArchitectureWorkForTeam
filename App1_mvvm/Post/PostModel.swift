//
//  PostModel.swift
//  App1_mvvm
//
//  Created by SEDAT DALKIRAN on 20.06.2022.
//

import Foundation

struct PostModel: Decodable {
    let userId : Int
    let id : Int
    let title : String
    let body : String
}
