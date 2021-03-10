//
//  UserFotoCVCell.swift
//  Interface_VKGB
//
//  Created by Виталий Степушин on 30.01.2021.
//

import UIKit

class UserFotoCVCell: UICollectionViewCell {
    
    @IBAction func pulsateLikeButton(_ sender: UIButton) {
        sender.pulsateLike()
    }
    
    @IBOutlet weak var userFoto: UIImageView!
    @IBOutlet var controllLike: UIButton!
    @IBOutlet var sumLike: UILabel!
    @IBAction func likeRun(_ sender: UIButton) {
        controllLike.isSelected.toggle()
        sumLike.textColor = controllLike.isSelected ? .red : .systemGray
        sumLike.text = controllLike.isSelected ? "1" : "0"
        if controllLike.isSelected {
                }
    }
    override func awakeFromNib() {
        controllLike.setImage(#imageLiteral(resourceName: "heartVKOn"), for: .selected)
        controllLike.setImage(#imageLiteral(resourceName: "heartVKOff"), for: .normal)
        
    }
}
