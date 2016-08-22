//
//  SingleProjectViewController.swift
//  DynamoDBSampleSwift
//
//  Created by Vidyadhar V. Thatte on 8/22/16.
//  Copyright © 2016 Amazon. All rights reserved.
//

import UIKit

class SingleProjectViewController: UITableViewController {
    
    
    @IBOutlet weak var projectImageView: UIImageView!
    @IBOutlet weak var projectNameLabel: UILabel!
    @IBOutlet weak var projectDescriptionTextView: UITextView!
    
    var projectName : String = ""
    var projectDescription : String = ""
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        projectNameLabel.text = projectName
        projectDescriptionTextView.text = projectDescription
        
    }
    
    
}
