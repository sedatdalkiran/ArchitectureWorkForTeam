//
//  UserTableViewCell.swift
//  App1_mvvm
//
//  Created by SEDAT DALKIRAN on 6.07.2022.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var nameTxt: UILabel!
    @IBOutlet weak var usernameTxt: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
