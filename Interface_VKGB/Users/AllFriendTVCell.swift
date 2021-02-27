//
//  AllFriendTVCell.swift
//  Interface_VKGB
//
//  Created by Виталий Степушин on 27.01.2021.
//

import UIKit

class AllFriendTVCell: UITableViewCell {

    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userAvatar: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
