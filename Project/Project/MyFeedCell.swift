//
//  MyFeedCell.swift
//  Project
//
//  Created by Vidyadhar V. Thatte on 9/22/16.
//  Copyright © 2016 Vidyadhar Thatte. All rights reserved.
//

import UIKit

class MyFeedCell: UITableViewCell {

    @IBOutlet weak var myFeedImageView: UIImageView!
    @IBOutlet weak var myProjectLabel: UILabel!
    @IBOutlet weak var myTitleLabel: UILabel!
    @IBOutlet weak var myActivityDiscription: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
