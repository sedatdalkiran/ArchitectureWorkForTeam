//
//  PostDetailViewController.swift
//  App1_mvvm
//
//  Created by SEDAT DALKIRAN on 20.06.2022.
//

import UIKit

class PostDetailViewController: UIViewController {

    @IBOutlet weak var bodyTxt: UILabel!
    
    var selectedBodyTxt: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bodyTxt.text = selectedBodyTxt
        
        bodyTxt.lineBreakMode = .byWordWrapping
        bodyTxt.numberOfLines = 0
    }
    

}
