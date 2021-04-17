//
//  UserFotoCVController.swift
//  Interface_VKGB
//
//  Created by Виталий Степушин on 30.01.2021.
//

import UIKit
import Alamofire
import AlamofireImage

class UserFotoCVController: UICollectionViewController {
    
    var userId: Int = 1
    var photos = [VKPhoto]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestData()
    }
    
    private func requestData() {
        VKService.instance.loadPhotos(userId: userId) { result in
            switch result {
            case .success(let photos):
                self.photos = photos
                self.collectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int  { 1 }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserFotoCVCell", for: indexPath) as! UserFotoCVCell
        let photo = photos[indexPath.row]
        let photoUrl = URL(string: photo.url)!
        cell.userFoto.af.setImage(withURL: photoUrl)

        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showAllUserPhoto",
//           let allFotoViewController = segue.destination as? AllFotoViewController,
//           let albumUserFoto = userF?.userPhotos {
//            allFotoViewController.albumUserFoto = albumUserFoto
//            let indexPath = collectionView.indexPathsForSelectedItems!.first!
//            allFotoViewController.selectedPhotoIndex = indexPath.row
//        }
    }
}

extension UserFotoCVController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.size.width / 3) - 1,
                      height: (view.frame.size.width / 3) - 1)
    }
}
