//
//  AllFriendTVController.swift
//  Interface_VKGB
//
//  Created by Виталий Степушин on 27.01.2021.
//

import UIKit

class AllFriendTVController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allFriend.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserFCell", for: indexPath)
                as! AllFriendTVCell
        let friendUser = allFriend[indexPath.row]
        cell.userName.text = "\(friendUser.userName) \(friendUser.userSurname)"
        cell.userName.adjustsFontSizeToFitWidth = true
        cell.userName.minimumScaleFactor = CGFloat(10)
        cell.userAvatar.image = friendUser.userAvatar
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showUserPhoto" {
            let albumUser = segue.destination as? UserFotoCVController
            if let indexPath = tableView.indexPathForSelectedRow {
                let UserFotos = allFriend[indexPath.row]
                albumUser?.UserF = UserFotos
            }
        }
    }
}
