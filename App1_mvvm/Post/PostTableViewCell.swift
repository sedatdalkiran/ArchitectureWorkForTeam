//
//  TableViewCell.swift
//  App1_mvvm
//
//  Created by SEDAT DALKIRAN on 20.06.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var idTxt: UILabel!
    @IBOutlet weak var titleTxt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
