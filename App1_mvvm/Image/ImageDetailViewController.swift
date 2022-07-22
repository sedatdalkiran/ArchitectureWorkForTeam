//
//  ImageDetailViewController.swift
//  App1_mvvm
//
//  Created by SEDAT DALKIRAN on 24.06.2022.
//

import UIKit
import SDWebImage
class ImageDetailViewController: UIViewController {
    
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var imageTitle: UILabel!
    
    var selectedImageUrl : String = ""
    var selectedImageLabel : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageTitle.lineBreakMode = .byWordWrapping
        imageTitle.numberOfLines = 0
        self.imageDetail.sd_setImage(with: URL(string: selectedImageUrl))
        imageTitle.text = selectedImageLabel
    }
    
    
}
