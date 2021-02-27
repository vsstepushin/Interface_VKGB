//
//  GroupsTVCell.swift
//  Interface_VKGB
//
//  Created by Виталий Степушин on 28.01.2021.
//

import UIKit

class GroupsTVCell: UITableViewCell {

    @IBOutlet weak var allGroupAva: UIImageView!
    @IBOutlet weak var allGroupName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
