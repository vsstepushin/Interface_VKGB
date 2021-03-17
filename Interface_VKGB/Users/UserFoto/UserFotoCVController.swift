//
//  UserFotoCVController.swift
//  Interface_VKGB
//
//  Created by Виталий Степушин on 30.01.2021.
//

import UIKit


class UserFotoCVController: UICollectionViewController {
    
    var userF: UserProfile?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\(String(describing: userF!.userName)) \(String(describing: userF!.userSurname))"
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int  { 1 }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        userF?.userPhotos.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserFoto", for: indexPath) as! UserFotoCVCell
        let albumUser = userF?.userPhotos[indexPath.row]
        cell.userFoto.image = albumUser
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAllUserPhoto",
           let allFotoViewController = segue.destination as? AllFotoViewController,
           let albumUserFoto = userF?.userPhotos {
            allFotoViewController.albumUserFoto = albumUserFoto
            let indexPath = collectionView.indexPathsForSelectedItems!.first!
            allFotoViewController.selectedPhotoIndex = indexPath.row
        }
    }
}
