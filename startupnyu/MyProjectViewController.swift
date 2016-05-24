//
//  ProjectTableViewController.swift
//  startupnyu
//
//  Created by Vidyadhar V. Thatte on 1/16/16.
//  Copyright © 2016 Polymafia. All rights reserved.
//

import UIKit
import Foundation
import Parse

class MyProjectTableViewController: UITableViewController  {
    
    var projectName : String = "name"
    var projectActivity : String = ""
    var projectAbout : String = ""
    var projectRequirements : String = ""
    
    @IBOutlet weak var projectImage: UIImageView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var projectDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // CUSTOMIZE UI
        projectDescriptionLabel.lineBreakMode = .ByWordWrapping
        projectDescriptionLabel.numberOfLines = 0
        
        // LOAD INFORMATION FROM DB
        
        // ASSIGN INFORMATION TO UI
        self.title = projectName
        
        // GESTURES
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        rightSwipe.direction = .Right
        view.addGestureRecognizer(rightSwipe)
        
        var query = PFQuery(className:"Project")
        query.whereKey("Name", equalTo:title!)
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects
                if let objects = objects {
                    for object in objects {
                        // Load information Here
                        
                        self.projectDescriptionLabel.text = object["About"] as! String
                        self.projectAbout = object["About"] as! String
                        self.projectRequirements = object["Requirements"] as! String
                        self.projectActivity = object["Activity"] as! String
                        
                    }
                }
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
        
        
    }
    
    @IBAction func segmentControlTapped(sender: UISegmentedControl) {
        
        switch segmentControl.selectedSegmentIndex
        {
        case 0:
            projectDescriptionLabel.text = self.projectAbout
        case 1:
            projectDescriptionLabel.text = self.projectActivity
        case 2:
            projectDescriptionLabel.text = self.projectRequirements
        default:
            break;
        }
        
    }
    
    func handleSwipes(sender:UISwipeGestureRecognizer) {
        
        if (sender.direction == .Right) {
            navigationController?.popToRootViewControllerAnimated(true)
        }
    }
}