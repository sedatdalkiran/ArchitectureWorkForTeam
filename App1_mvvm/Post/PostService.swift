//
//  PostService.swift
//  App1_mvvm
//
//  Created by SEDAT DALKIRAN on 20.06.2022.
//

import Foundation

class PostService {
    
    
    func getPosts (url: URL, completion: @escaping ([PostModel]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
            else if let data = data {
                let postList = try? JSONDecoder().decode([PostModel].self, from: data)
                
                if let postList = postList {
                    completion(postList)
                }
            }
        }.resume()
    }
}
