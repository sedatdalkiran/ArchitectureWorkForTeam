//
//  ImageViewModel.swift
//  App1_mvvm
//
//  Created by SEDAT DALKIRAN on 22.06.2022.
//

import Foundation

protocol ImageListViewModelDelegate: AnyObject {
    func dataLoaded(imageList: [ImageModel])
}

class ImageListViewModel {
    private var imageList: [ImageModel] = []
    
    weak var delegate: ImageListViewModelDelegate? //viewmodel -> vc
    
    func loadData() {
            let apiUrl = URL(string: "https://jsonplaceholder.typicode.com/photos")
            let session = URLSession.shared.dataTask(with: URLRequest(url: apiUrl!)) { (data, response, error ) in
                if let httpResponse = response as? HTTPURLResponse {
                    if(httpResponse.statusCode != 200) {
                        print("error in loadData")
                    }
                }
                
                if let myData = data, let images = try? JSONDecoder().decode([ImageModel].self, from: myData)  {
                    self.imageList = images
                    DispatchQueue.main.async {
                        self.delegate?.dataLoaded(imageList: images)
                    }
                }
            }
            session.resume()
        }
}

