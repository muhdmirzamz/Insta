//
//  PhotoItem.swift
//  Insta
//
//  Created by Muhd Mirza on 26/3/17.
//  Copyright © 2017 muhdmirzamz. All rights reserved.
//

import Foundation
import UIKit

class PhotoItem {
	let image: UIImage
	let caption: String
	
	init(image: UIImage, and caption: String) {
		self.image = image
		self.caption = caption
	}
}
