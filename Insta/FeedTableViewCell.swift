//
//  FeedTableViewCell.swift
//  Insta
//
//  Created by Muhd Mirza on 20/4/17.
//  Copyright © 2017 muhdmirzamz. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
	
	@IBOutlet var feedImageView: UIImageView!
	@IBOutlet var captionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
