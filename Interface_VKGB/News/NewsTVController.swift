//
//  NewsTVController.swift
//  Interface_VKGB
//
//  Created by Виталий Степушин on 05.03.2021.
//

import UIKit

class NewsTVController: UITableViewController {
    let allNewsIn = AllNews.newsMake()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int { 1 }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { allNewsIn.count }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTVCell", for: indexPath) as! NewsTVCell

        let datePost = getDateTime()
        cell.dateContentNews.text = datePost
        cell.nameUserNews.text = allNewsIn[indexPath.row].nameUserNews
        cell.avatarUserNews.image = allNewsIn[indexPath.row].avatarUserNews
        cell.imageContentNews.image = allNewsIn[indexPath.row].imageContentNews
        cell.contentUserNews.text = allNewsIn[indexPath.row].contentUserNews
        let viewsCounter = Int.random(in: 0...100)
        cell.viewsContentNews.textColor = viewsCounter == 0 ? .lightGray : .systemBlue
        cell.viewsContentNews.text = String(viewsCounter)
        
        

        return cell
    }

}
