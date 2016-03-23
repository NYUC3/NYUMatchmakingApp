//
//  ProfileViewController.swift
//  startupnyu
//
//  Created by Vidyadhar V. Thatte on 1/16/16.
//  Copyright © 2016 Polymafia. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UITableViewController{
    
    @IBOutlet weak var settingsButton: UIBarButtonItem!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var segmentView: UISegmentedControl!
    @IBOutlet weak var userInformationLabel: UILabel!
    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var onelineDescriptionLabel: UILabel!
 
    
    var bio = ""
    var links = ""
    var skills = ""
    var fullName = ""
    var oneLineDescription = ""
    
    
    override func viewDidLoad() {
        
        // CUSTOMIZE UI
        self.title = "Profile"
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width / 2;
        self.profileImageView.clipsToBounds = true;
        if let font = UIFont(name: "AppleSDGothicNeo-Regular ", size: 34) {
            UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName: font]
        }
        self.userInformationLabel.numberOfLines = 0
        userInformationLabel.lineBreakMode = .ByWordWrapping
        
        let navigationItem = UINavigationItem()
        let img = UIImage(named: "Settings")
        let button = UIBarButtonItem(image: img, style:UIBarButtonItemStyle.Plain , target: self, action: "btnClicked")
        button.tintColor = UIColor.blackColor()
        self.navigationItem.rightBarButtonItem = button

        let query = PFQuery(className:"Student")
        query.whereKey("email", equalTo:"vdthatte@nyu.edu")
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects
                if let objects = objects {
                    for object in objects {
                        // FULL NAME
                        
                        self.fullnameLabel.text = (object["FirstName"] as! String) + " " + (object["LastName"] as! String)
                        
                        self.onelineDescriptionLabel.text = object["OneLineDescription"] as? String
                        
                        self.userInformationLabel.text = object["bio"] as? String
                        
                       // self.profileImageView.image = UIImage(data: object["ProfilePicture"])
                    }
                }
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
    }
    
    
    @IBAction func segmentTapped(sender: UISegmentedControl) {
        
        switch segmentView.selectedSegmentIndex
        {
        case 0:
            
            let query = PFQuery(className:"Student")
            query.whereKey("email", equalTo:"vdthatte@nyu.edu")
            query.findObjectsInBackgroundWithBlock {
                (objects: [PFObject]?, error: NSError?) -> Void in
                
                if error == nil {
                    // The find succeeded.
                    print("Successfully retrieved \(objects!.count) scores.")
                    // Do something with the found objects
                    if let objects = objects {
                        for object in objects {
                            self.userInformationLabel.text = object["bio"] as? String
                        }
                    }
                } else {
                    // Log details of the failure
                    print("Error: \(error!) \(error!.userInfo)")
                }
            }
            
        case 1:
            
            let query = PFQuery(className:"Student")
            query.whereKey("email", equalTo:"vdthatte@nyu.edu")
            query.findObjectsInBackgroundWithBlock {
                (objects: [PFObject]?, error: NSError?) -> Void in
                
                if error == nil {
                    // The find succeeded.
                    print("Successfully retrieved \(objects!.count) scores.")
                    // Do something with the found objects
                    if let objects = objects {
                        for object in objects {
                            self.userInformationLabel.text = object["Links"] as? String
                        }
                    }
                } else {
                    // Log details of the failure
                    print("Error: \(error!) \(error!.userInfo)")
                }
            }
            
        case 2:
            
            let query = PFQuery(className:"Student")
            query.whereKey("email", equalTo:"vdthatte@nyu.edu")
            query.findObjectsInBackgroundWithBlock {
                (objects: [PFObject]?, error: NSError?) -> Void in
                
                if error == nil {
                    // The find succeeded.
                    print("Successfully retrieved \(objects!.count) scores.")
                    // Do something with the found objects
                    if let objects = objects {
                        for object in objects {
                            self.userInformationLabel.text = object["Skills"] as? String
                        }
                    }
                } else {
                    // Log details of the failure
                    print("Error: \(error!) \(error!.userInfo)")
                }
            }

        default:
            break; 
        }
    }
    
    func btnClicked(){
        let storyboard = UIStoryboard(name: "ProfileViewStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("settingsNav") as! SettingsNavigationController
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func unwindToProfileView(segue: UIStoryboardSegue) {
        // some code to execute
    } // unwindToPrevious
    
    

}
