//
//  AllDroupsTVController.swift
//  Interface_VKGB
//
//  Created by Виталий Степушин on 28.01.2021.
//

import UIKit
import Alamofire
import AlamofireImage
import RealmSwift

class AllDroupsTVController: UITableViewController {
    
    private var groups = [VKGroup]()
    private var filteredGroups = [VKGroup]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    private var token: NotificationToken?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestData()
        navigationItem.rightBarButtonItem = nil
        tableView.tableFooterView = UIView()
    }
    
    private func requestData() {
        VKService.instance.loadGroups { result in
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
            guard let groups = RealmService.instance.fetchObjects(VKGroup.self) else {
                return
            }
            self.groups = groups
            self.configurRealmNotifications()
        }

    
    private func configurRealmNotifications() {
        guard let realm = try? Realm() else { return }
        token = realm.objects(VKGroup.self).observe({ [weak self] changes in
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

    @IBAction func addGroups (segue: UIStoryboardSegue) {
//        guard
//            segue.identifier == "addGroups",
//            let groupsController = segue.source as? GroupsTVController,
//            let indexPath = groupsController.tableView.indexPathForSelectedRow,
//            !myGroup.contains(groupsController.allGroup[indexPath.row])
//        else { return }
//        let group = groupsController.allGroup[indexPath.row]
//        myGroup.append(group)
//        tableView.reloadData()
                       }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredGroups.isEmpty ? groups.count : filteredGroups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupsFCell", for: indexPath)
                as! AllGroupsTVCell
        let group = filteredGroups.isEmpty ? groups[indexPath.row] : filteredGroups[indexPath.row]
        let avatarUrl = URL(string: group.avatarUrl)!
        cell.groupName.text = group.groupName
        cell.groupAvatar.af.setImage(withURL: avatarUrl)
        cell.groupAvatar.setNeedsDisplay()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
        groups.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
}
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return filteredGroups.isEmpty ? true : false
    }
}

extension AllDroupsTVController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let searchText = searchBar.text, !searchText.isEmpty else {
            clearSearch(searchBar)
            return
        }
        filteredGroups = groups.filter { $0.groupName.contains(searchText) }
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
        filteredGroups = [VKGroup]()
    }
}

