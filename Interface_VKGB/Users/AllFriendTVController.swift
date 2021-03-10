//
//  AllFriendTVController.swift
//  Interface_VKGB
//
//  Created by Виталий Степушин on 27.01.2021.
//

import UIKit

struct FriendSection {
    var titleSection: String
    var itemsSection: [UserProfile]
}

class AllFriendTVController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBarFriend: UISearchBar!
    
    var filterFriend = [UserProfile]()
    var sectionFriend = [FriendSection]()
    var searchingFriend = false
    
    override func viewWillAppear(_ animated: Bool) {
        tableAnimate()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dictionaryFriend = Dictionary.init(grouping: allFriend) {
            $0.userName.prefix(1)
        }
        sectionFriend = dictionaryFriend.map {
            FriendSection(titleSection: String($0.key), itemsSection: $0.value)
        }
        sectionFriend.sort {$0.titleSection < $1.titleSection}
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        if searchingFriend {
            return 1
        } else {
            return sectionFriend.count
        }
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        sectionFriend.map {$0.titleSection}
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchingFriend {
            return filterFriend.count
        } else {
            return sectionFriend[section].itemsSection.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserFCell", for: indexPath)
                as! AllFriendTVCell
        let friendUser = allFriend[indexPath.row]
        cell.userName.text = "\(friendUser.userName) \(friendUser.userSurname)"
        cell.userName.adjustsFontSizeToFitWidth = true
        cell.userName.minimumScaleFactor = CGFloat(10)
        cell.userAvatar.image = friendUser.userAvatar
        
        if searchingFriend {
            cell.userName.text = "\(filterFriend[indexPath.row].userName) \(filterFriend[indexPath.row].userSurname)"
            cell.userAvatar.image = filterFriend[indexPath.row].userAvatar
        } else {
            cell.userName.text = "\(sectionFriend[indexPath.section].itemsSection[indexPath.row].userName) \(sectionFriend[indexPath.section].itemsSection[indexPath.row].userSurname)"
            cell.userAvatar.image = sectionFriend[indexPath.section].itemsSection[indexPath.row].userAvatar
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
        let headerVievFriend = UIView()
        let lableFriend = UILabel()
        headerVievFriend.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        lableFriend.text = sectionFriend[section].titleSection
        lableFriend.textColor = UIColor.black
        lableFriend.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.thin)
        headerVievFriend.addSubview(lableFriend)
        lableFriend.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lableFriend.centerYAnchor.constraint(equalTo: headerVievFriend.centerYAnchor),
            lableFriend.leadingAnchor.constraint(equalTo: headerVievFriend.leadingAnchor, constant: 16),
            lableFriend.trailingAnchor.constraint(equalTo: headerVievFriend.trailingAnchor, constant: -16)])
        return headerVievFriend
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showUserPhoto" {
            let albumUser = segue.destination as? UserFotoCVController
            if let indexPath = tableView.indexPathForSelectedRow {
                if searchingFriend {
                    albumUser?.UserF = filterFriend[indexPath.row]
                } else {
                    albumUser?.UserF = sectionFriend[indexPath.section].itemsSection[indexPath.row]
                }
            }
        }
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterFriend = allFriend.filter({$0.userName.lowercased().prefix(searchText.count) == searchText.lowercased()})
            searchingFriend = true
            tableView.reloadData()
        }

        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchingFriend = false
            searchBar.text = ""
            tableView.reloadData()
        }
}
