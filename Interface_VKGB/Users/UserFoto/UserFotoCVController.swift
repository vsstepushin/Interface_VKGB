//
//  UserFotoCVController.swift
//  Interface_VKGB
//
//  Created by Виталий Степушин on 30.01.2021.
//

import UIKit


class UserFotoCVController: UICollectionViewController {
    var UserF: UserProfile?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\(String(describing: UserF!.userName)) \(String(describing: UserF!.userSurname))"
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int  { 1 }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        UserF?.userPhotos.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserFoto", for: indexPath) as! UserFotoCVCell
        let albumUser = UserF?.userPhotos[indexPath.row]
        cell.userFoto.image = albumUser
        return cell
    }

  
}
