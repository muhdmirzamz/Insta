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
	
	// think of this as one section
	// and the insets are basically the sides of it
	// the insets are the length between the content and the edge
	// http://stackoverflow.com/a/23794688
	let sectionInsets = UIEdgeInsetsMake(50, 20, 50, 20)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		self.collectionView.dataSource = self
		self.collectionView.delegate = self
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
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		// 3 items per row
		// counting the insets, there are 4 padding 
		// basically count the spaces in between the items
		// so take the left of the section inset and multiply it by the number of padding
		let paddingSpace = self.sectionInsets.left * (self.itemsPerRow + 1)
		let availableWidth = view.frame.width - paddingSpace
		let widthPerItem = availableWidth / self.itemsPerRow
		
		return CGSize.init(width: widthPerItem, height: widthPerItem)
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
