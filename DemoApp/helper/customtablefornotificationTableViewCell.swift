//
//  customtablefornotificationTableViewCell.swift
//  DemoApp
//
//  Created by sm on 15/07/20.
//  Copyright © 2020 sushant. All rights reserved.
//

import UIKit

class customtablefornotificationTableViewCell: UITableViewCell {
     @IBOutlet weak var name: UILabel!
       @IBOutlet weak var msg: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
