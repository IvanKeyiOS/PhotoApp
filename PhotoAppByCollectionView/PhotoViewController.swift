//
//  PhotoViewController.swift
//  PhotoAppByCollectionView
//
//  Created by Иван Курганский on 31/10/2023.
//

import UIKit

class PhotoViewController: UIViewController {
    
    var image: UIImage?
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoImageView.image = image
    }
    
    @IBAction func shareActionButton(_ sender: Any) {
        let shareController = UIActivityViewController(activityItems: [image!], applicationActivities: nil)
        shareController.completionWithItemsHandler = {_, bool, _, _ in
            if bool {
                print("Succes!")
            }
        }
        present(shareController, animated: true, completion: nil)
    }
}
