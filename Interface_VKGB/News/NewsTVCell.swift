//
//  NewsTVCell.swift
//  Interface_VKGB
//
//  Created by Виталий Степушин on 05.03.2021.
//

import UIKit

class NewsTVCell: UITableViewCell {
    
    @IBOutlet weak var avatarUserNews: AvaView!
    @IBOutlet weak var nameUserNews: UILabel!
    @IBOutlet weak var dateContentNews: UILabel!
    @IBOutlet weak var contentUserNews: UILabel!
    @IBOutlet weak var imageContentNews: PhotoView!
    @IBOutlet weak var likeContentButtonNews: UIButton!
    @IBOutlet weak var likeCommentButtonNews: UIButton!
    @IBOutlet weak var likeContentNews: UILabel!
    @IBOutlet weak var viewsContentNews: UILabel!
    
    @IBAction func pulsateLikeButtonNews(_ sender: UIButton) {
        sender.pulsateLike()
    }
    @IBAction func likeNews(_ sender: Any) {
        likeContentButtonNews.isSelected.toggle()
        likeContentNews.text = likeContentButtonNews.isSelected ? "1" : "0"
        if likeContentButtonNews.isSelected {
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        likeContentButtonNews.setImage(#imageLiteral(resourceName: "heartVKOn"), for: .selected)
        likeContentButtonNews.setImage(#imageLiteral(resourceName: "heartVKOff"), for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
