//
//  ProjectTableViewController.swift
//  startupnyu
//
//  Created by Vidyadhar V. Thatte on 1/16/16.
//  Copyright © 2016 Polymafia. All rights reserved.
//

import UIKit
import Foundation


class MyProjectTableViewController: UITableViewController  {
    
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
        
        // LOAD INFORMATION FROM DB
        
        // ASSIGN INFORMATION TO UI
        self.title = projectName
        
        // GESTURES
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        rightSwipe.direction = .Right
        view.addGestureRecognizer(rightSwipe)
        
        let play = UIBarButtonItem(title: "Edit", style: .Plain, target: self, action: "editTapped")
        
        navigationItem.rightBarButtonItems =  [play]
        
    }
    
    @IBAction func unwindToMyProjects(segue: UIStoryboardSegue) {
        // some code to execute
    } // unwindToPrevious
    
    func editTapped(){
        
        let vc = EditProjectNavigationBarController()
        self.presentViewController(vc, animated: true, completion: nil)
    
    }
    
    // MARK:- Segment Control Methods
    
    @IBAction func segmentControlTapped(sender: UISegmentedControl) {
        
        switch segmentControl.selectedSegmentIndex
        {
        case 0:
            projectDescriptionLabel.text = self.projectAbout
        case 1:
            projectDescriptionLabel.text = self.projectActivity
        default:
            break;
        }
        
    }
    
    // MARK:- Swipe Gesture Methods
    
    func handleSwipes(sender:UISwipeGestureRecognizer) {
        
        if (sender.direction == .Right) {
            navigationController?.popToRootViewControllerAnimated(true)
        }
    }
}