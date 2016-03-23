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

class ProjectTableViewController: UITableViewController  {
    
    var projectName : String = "name"

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
        
    }

    @IBAction func segmentControlTapped(sender: UISegmentedControl) {
        
        switch segmentControl.selectedSegmentIndex
        {
        case 0:
            projectDescriptionLabel.text = "We're building a super-fast, futuristic transport technology. Inspired by Elon Musk's Hyper Loop cocept, professors at the University of California have teamed up with students to make the futuristic concept a reality."
        case 1:
            projectDescriptionLabel.text = "Find us at the prototyping fund showcase!";
        case 2:
            projectDescriptionLabel.text = "Mechanical Engineers!";
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
