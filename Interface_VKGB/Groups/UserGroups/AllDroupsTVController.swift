//
//  AllDroupsTVController.swift
//  Interface_VKGB
//
//  Created by Виталий Степушин on 28.01.2021.
//

import UIKit

class AllDroupsTVController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func addGroups (segue: UIStoryboardSegue) {
        guard
            segue.identifier == "addGroups",
            let groupsController = segue.source as? GroupsTVController,
            let indexPath = groupsController.tableView.indexPathForSelectedRow,
            !myGroup.contains(groupsController.allGroup[indexPath.row])
        else { return }
        let group = groupsController.allGroup[indexPath.row]
        myGroup.append(group)
        tableView.reloadData()
                       }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myGroup.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupsFCell", for: indexPath)
                as! AllGroupsTVCell
        let groupsUser = myGroup[indexPath.row]
        cell.groupName.text = "\(groupsUser.groupName)"
        cell.groupName.adjustsFontSizeToFitWidth = true
        cell.groupName.minimumScaleFactor = CGFloat(10)
        cell.groupAvatar.image = groupsUser.groupAvatar
        return cell
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myGroup.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
}
