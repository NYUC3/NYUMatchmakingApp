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
import MessageUI


class ProjectTableViewController: UITableViewController, MFMailComposeViewControllerDelegate{
    
    var projectName : String = ""
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
        
        // ASSIGN INFORMATION TO UI
        self.title = projectName

        // GESTURES
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        rightSwipe.direction = .Right
        view.addGestureRecognizer(rightSwipe)
        
        let query = PFQuery(className:"Project")
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
                        
                        self.projectDescriptionLabel.text = object["About"] as? String
                        self.projectAbout = object["About"] as! String
                        self.projectActivity = object["Activity"] as! String
                        
                        if let userPicture = object["Image"] as? PFFile {
                            userPicture.getDataInBackgroundWithBlock { (imageData: NSData?, error: NSError?) -> Void in
                                if (error == nil) {
                                    self.projectImage.image = UIImage(data:imageData!)!
                                }
                            }
                        }
                    
                    }
                }
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
        
    }
    
    @IBAction func shareThroughEmailTapped(sender: AnyObject) {
        
        // TODO: Create an email with the necessary project information
        let email = MFMailComposeViewController()
        presentViewController(email, animated: true, completion: nil)
        email.mailComposeDelegate = self
        email.setSubject("Interesting Project to work on!")
        email.setMessageBody("Some example text", isHTML: false) // or true, if you prefer
    }

    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func segmentControlTapped(sender: UISegmentedControl) {
        // TODO: Load descriptions from the db
        switch segmentControl.selectedSegmentIndex {
        case 0:
            projectDescriptionLabel.text = self.projectAbout
        case 1:
            projectDescriptionLabel.text = self.projectActivity
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
