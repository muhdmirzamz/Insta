//
//  ProfileViewController.swift
//  Insta
//
//  Created by Muhd Mirza on 25/3/17.
//  Copyright © 2017 muhdmirzamz. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UploadProtocol {

	@IBOutlet var collectionView: UICollectionView!
	
	var photoItemArray = [PhotoItem]()
	
	let itemsPerRow: CGFloat = 3
	
	// think of insets as the padding to your div element in web dev
	// http://stackoverflow.com/a/23794688
	let sectionInsets = UIEdgeInsetsMake(10, 10, 10, 10)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		self.collectionView.dataSource = self
		self.collectionView.delegate = self
//		self.collectionView.backgroundColor = UIColor.blue
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
		cell.backgroundColor = UIColor.black
		
		return cell
	}
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func reloadCollectionView(WithData data: PhotoItem) {	
		self.photoItemArray.append(data)

		self.collectionView.reloadData()
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		// the space between images is considered padding
		// take that away from the main width 
		// and you get the amount of available space for cells
		let availableSpace = CGFloat(self.view.frame.width) - (self.sectionInsets.left * (self.itemsPerRow + 1))
		let cellWidth = availableSpace / self.itemsPerRow
		
	
		return CGSize.init(width: cellWidth, height: cellWidth)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return self.sectionInsets
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return self.sectionInsets.left
	}

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "upload" {
			let destinationVC = segue.destination as? UploadViewController
			destinationVC?.delegate = self
		}
    }

}
