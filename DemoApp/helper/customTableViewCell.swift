//
//  customTableViewCell.swift
//  DemoApp
//
//  Created by sm on 07/07/20.
//  Copyright © 2020 sushant. All rights reserved.
//

import UIKit

class customTableViewCell: UITableViewCell {

    @IBOutlet weak var cellview: UIView!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var tableimg: UIImageView!
    @IBOutlet weak var TableImage: UIImageView!
    @IBOutlet weak var tablelbl: UILabel!
    @IBOutlet weak var TabelLebal: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var user_name: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
