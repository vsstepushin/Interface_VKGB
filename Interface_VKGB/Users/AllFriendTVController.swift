//
//  AllFriendTVController.swift
//  Interface_VKGB
//
//  Created by Виталий Степушин on 27.01.2021.
//

import UIKit
import Alamofire
import AlamofireImage
import RealmSwift

//struct FriendSection {
//    var titleSection: String
//    var itemsSection: [UserProfile]
//}

class AllFriendTVController: UITableViewController {
   
    
    
    @IBOutlet weak var searchBarFriend: UISearchBar!
    
    var filterFriend = [VKUser]() {
        didSet {
                    tableView.reloadData()
        }
    }
    private var users = [VKUser]()
    
    private var userGroups = [String: [VKUser]]() {
        didSet {
            users = userGroups.flatMap { $0.value }.sorted { $0.lastName < $1.lastName }
            tableView.reloadData()
        }
    }
    
    var sectionFriend = [String]()
    var searchingFriend = false
    private var token: NotificationToken?
    
    override func viewWillAppear(_ animated: Bool) {
        tableAnimate()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        requestData()
        tableView.tableFooterView = UIView()
    }
    private func requestData() {
             VKService.instance.loadFriends { result in
                 switch result {
                 case .success:
                    self.fetchCachedData()
                 case .failure(let error):
                    self.fetchCachedData()
                    print(error)
                 }
             }
         }
    private func fetchCachedData() {
             guard let users = RealmService.instance.fetchObjects(VKUser.self) else {
                 return
             }
             self.users = users
             self.configureUserGroups(with: users)
             self.configurRealmNotifications()
         }
    
    private func configurRealmNotifications() {
        guard let realm = try? Realm() else { return }
        token = realm.objects(VKUser.self).observe({ [weak self] changes in
            switch changes {
            case .initial:
                self?.tableView.reloadData()
            case .update(_,
                         deletions: let deletions,
                         insertions: let insertions,
                         modifications: let modifications):
                self?.tableView.beginUpdates()
                self?.tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }),
                                     with: .automatic)
                self?.tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}),
                                     with: .automatic)
                self?.tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }),
                                     with: .automatic)
                self?.tableView.endUpdates()
            case .error(let error):
                fatalError(error.localizedDescription)
            }
        })
    }
    
    private func configureUserGroups(with users: [VKUser]) {
        for user in users {
            let userKey = String(user.lastName.prefix(1))
            if var userGroup = userGroups[userKey] {
                userGroup.append(user)
                userGroups[userKey] = userGroup
            } else {
                userGroups[userKey] = [user]
            }
        }
        sectionFriend = [String](userGroups.keys)
        sectionFriend = sectionFriend.sorted { $0 < $1 }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return filterFriend.isEmpty ? sectionFriend.count : 1
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return filterFriend.isEmpty ? sectionFriend : nil
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return filterFriend.isEmpty ? sectionFriend[section] : nil
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if filterFriend.isEmpty {
            let sectionTitle = sectionFriend[section]
            return SectionHeaderView(sectionTitle: sectionTitle)
        } else {
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if filterFriend.isEmpty {
            let sectionTitle = sectionFriend[section]
            return userGroups[sectionTitle]?.count ?? 0
        } else {
            return filterFriend.count
        }
    }

        
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserFCell", for: indexPath)
                as! AllFriendTVCell
        var user: VKUser? = nil
        if filterFriend.isEmpty {
            let sectionTitle = sectionFriend[indexPath.section]
            user = userGroups[sectionTitle]?[indexPath.row]
        } else {
            user = filterFriend[indexPath.row]
        }
        let avatarUrl = URL(string: user!.avatarUrl)!
        cell.userName.text = String(format: "%@ %@", user!.firstName, user!.lastName)
        cell.userAvatar.af.setImage(withURL: avatarUrl)
        cell.userAvatar.setNeedsDisplay()
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPhotos" {
            guard let viewController = segue.destination as? UserFotoCVController,
                let selectedIndexPath = tableView.indexPathForSelectedRow else {
                return
            }
            
            var user: VKUser? = nil
            if filterFriend.isEmpty {
                let sectionTitle = sectionFriend[selectedIndexPath.section]
                user = userGroups[sectionTitle]?[selectedIndexPath.row]
            } else {
                user = filterFriend[selectedIndexPath.row]
            }
            viewController.userId = user!.userId
        }
    }
}

extension AllFriendTVController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let searchText = searchBar.text, !searchText.isEmpty else {
            clearSearch(searchBar)
            return
        }
        filterFriend = users.filter { $0.lastName.lowercased().contains(searchText.lowercased()) ||
            $0.firstName.lowercased().contains(searchText.lowercased()) }
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        clearSearch(searchBar)
    }
    
    private func clearSearch(_ searchBar: UISearchBar) {
        searchBar.text = nil
        view.endEditing(true)
        filterFriend = [VKUser]()
    }
}
