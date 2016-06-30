//
//  ProjectTableViewController.swift
//  startupnyu
//
//  Created by Vidyadhar V. Thatte on 1/16/16.
//  Copyright © 2016 Polymafia. All rights reserved.
//

import UIKit
import Foundation
import MessageUI


class ProjectTableViewController: UITableViewController, MFMailComposeViewControllerDelegate{
    
    @IBOutlet weak var projectImage: UIImageView!                       // project profile image
    @IBOutlet weak var segmentControl: UISegmentedControl!              // segment control
    @IBOutlet weak var projectDescriptionLabel: UILabel!                // project description
    
    
    
    var projectName : String = ""
    var projectActivity : String = ""
    var projectAbout : String = ""
    var projectRequirements : String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Customize UI
        projectDescriptionLabel.lineBreakMode = .ByWordWrapping
        projectDescriptionLabel.numberOfLines = 0
        
        // Setting project name as title
        self.title = projectName

        // Setup swipe gesture - left slipe as back button
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(ProjectTableViewController.handleSwipes(_:)))
        rightSwipe.direction = .Right
        view.addGestureRecognizer(rightSwipe)
        
    }
    
    
    
    @IBAction func shareThroughEmailTapped(sender: AnyObject) {
        
        // TODO: Create an email with the necessary project information and fix bug
        
        let email = MFMailComposeViewController()
        presentViewController(email, animated: true, completion: nil)
        email.mailComposeDelegate = self
        email.setSubject("Interesting Project to work on!")
        email.setMessageBody("Some example text", isHTML: false) // or true, if you prefer
        
    } // shareThroughEmailTapped
    
    

    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    } // mailComposeController

    
    
    @IBAction func segmentControlTapped(sender: UISegmentedControl) {
        
        // TODO: Load descriptions from the db
        switch segmentControl.selectedSegmentIndex {
            
        case 0:
            projectDescriptionLabel.text = self.projectAbout
        case 1:
            projectDescriptionLabel.text = self.projectActivity
        default:
            break;
            
        } // switch
        
    } // segmentControlTapped
    
    
    
    func handleSwipes(sender:UISwipeGestureRecognizer) {
        
        if (sender.direction == .Right) {
            
            navigationController?.popToRootViewControllerAnimated(true)
            
        } // if

    } // handleSwipes()
    
    
    
} // ProjectTableViewController
