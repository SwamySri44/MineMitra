//
//  UsersListTableViewCell.swift
//  MineMitra
//
//  Created by Vemulawada Swamy on 28/04/22.
//

import UIKit

class UsersListTableViewCell: UITableViewCell {
    @IBOutlet weak var districtname: UILabel!
    @IBOutlet weak var serialNumber: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
