//
//  ProfileViewController.swift
//  Insta
//
//  Created by Muhd Mirza on 25/3/17.
//  Copyright © 2017 muhdmirzamz. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDataSource, UploadProtocol {

	@IBOutlet var collectionView: UICollectionView!
	
	var photoItemArray = [PhotoItem]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		self.collectionView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.photoItemArray.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PhotoCollectionViewCell

		cell.imageView.image = self.photoItemArray[indexPath.row].image
		
		return cell
	}
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func reloadCollectionView(WithData data: PhotoItem) {
		self.photoItemArray.append(data)
		
		self.collectionView.reloadData()
	}

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "upload" {
			let destinationVC = segue.destination as? UploadViewController
			destinationVC?.delegate = self
		}
    }

}
