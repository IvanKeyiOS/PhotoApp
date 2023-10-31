//
//  PhotosCollectionViewController.swift
//  PhotoAppByCollectionView
//
//  Created by Иван Курганский on 29/10/2023.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    let photos = ["super-bike-1", "super-bike-2", "super-bike-3", "super-bike-4", "super-bike-5", "super-bike-6", "super-bike-7", "super-bike-8", "super-bike-9", "super-bike-10", "super-bike-11", "super-bike-12", "super-bike-13", "super-bike-14", "super-bike-15"]
    let itemsPerRow: CGFloat = 2
    let sectionInserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "PhotoStoryboard", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "PhotoViewController") as! PhotoViewController
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? PhotoCell
        let imageName = photos[indexPath.item]
        let image = UIImage(named: imageName)
        cell?.motImageView.image = image
        viewController.image = cell!.motImageView.image
        present(viewController, animated: true)
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
        
        let imageName = photos[indexPath.item]
        let image = UIImage(named: imageName)
        
        cell.motImageView.image = image
        
        return cell
    }
}

extension PhotosCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingWidth = sectionInserts.left * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInserts
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
}
