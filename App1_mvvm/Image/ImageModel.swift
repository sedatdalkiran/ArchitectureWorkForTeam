//
//  ImageModel.swift
//  App1_mvvm
//
//  Created by SEDAT DALKIRAN on 22.06.2022.
//

import Foundation


struct ImageModel: Decodable {
    
    let albumId : Int
    let id : Int
    let title : String
    let url : String
    let thumbnailUrl : String
    
}
