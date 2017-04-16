//
//  UserProjectTableViewCell.swift
//  Project
//
//  Created by Vidyadhar V. Thatte on 4/16/17.
//  Copyright © 2017 Vidyadhar Thatte. All rights reserved.
//

import UIKit

class UserProjectTableViewCell: UITableViewCell {

    @IBOutlet weak var projectName: UILabel!
    @IBOutlet weak var projectImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
