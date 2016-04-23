//
//  MyProjectsTableViewCell.swift
//  startupnyu
//
//  Created by Vidyadhar V. Thatte on 4/7/16.
//  Copyright © 2016 Polymafia. All rights reserved.
//

import UIKit

class MyProjectsTableViewCell: UITableViewCell {

    @IBOutlet weak var projectName: UILabel!
    @IBOutlet weak var projectImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
