//
//  AllGroupsTVCell.swift
//  Interface_VKGB
//
//  Created by Виталий Степушин on 28.01.2021.
//

import UIKit

class AllGroupsTVCell: UITableViewCell {

    
    @IBOutlet weak var groupAvatar: UIImageView!
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var shadowViewAllGroup: ShadowView!
    @IBAction func avatarAnimateGroup(_ sender: UIImageView) {
        shadowViewAllGroup.avatarAnimate()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
