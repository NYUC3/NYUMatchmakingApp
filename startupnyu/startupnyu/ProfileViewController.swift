//
//  ProfileViewController.swift
//  startupnyu
//
//  Created by Vidyadhar V. Thatte on 1/16/16.
//  Copyright © 2016 Polymafia. All rights reserved.
//

import UIKit

class ProfileViewController: UITableViewController{
    
    @IBOutlet weak var settingsButton: UIBarButtonItem!         // settings button
    @IBOutlet weak var profileImageView: UIImageView!           // profile image view
    @IBOutlet weak var userInformationLabel: UILabel!           // user information label
    @IBOutlet weak var fullnameLabel: UILabel!                  // full name label
    @IBOutlet weak var onelineDescriptionLabel: UILabel!        // one line description label
 
    // variables to store student information. will be shown blank if nothing is retrieved from the DB
    
    var bio = ""
    var links = ""
    var skills = ""
    var fullName = ""
    var oneLineDescription = ""
    
    var studentName : String?                                   // save student name from previous screen/class
    
    override func viewDidLoad() {
        
        // Customize UI
        
        self.title = "Profile"
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width / 2;
        self.profileImageView.clipsToBounds = true;
        
        if let font = UIFont(name: "AppleSDGothicNeo-Regular ", size: 34) {
            UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName: font]
        } // if
        
        // label
        self.userInformationLabel.numberOfLines = 0
        userInformationLabel.lineBreakMode = .ByWordWrapping
        
        // Settings Button
        let img = UIImage(named: "Settings")
        let button = UIBarButtonItem(image: img, style:UIBarButtonItemStyle.Plain , target: self, action: #selector(ProfileViewController.btnClicked))
        button.tintColor = UIColor.blackColor()
        self.navigationItem.rightBarButtonItem = button
    
    } // viewDidLoad()
    
    func btnClicked(){
    
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("settingsNav") as! SettingsNavigationController
        self.presentViewController(vc, animated: true, completion: nil)
    
    } // btnClicked()
    
    @IBAction func unwindToProfileView(segue: UIStoryboardSegue) {
        // some code to execute
    } // unwindToPrevious
}
