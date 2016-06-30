//
//  SettingsViewContoller.swift
//  startupnyu
//
//  Created by Vidyadhar V. Thatte on 1/17/16.
//  Copyright © 2016 Polymafia. All rights reserved.
//

import UIKit


class SettingsViewContoller: UITableViewController {

    @IBAction func logoutButton(sender: UIButton) {
        
        //PFUser.logOut()
        let storyboard = UIStoryboard(name: "LoginSignupStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("login") as! LoginViewController
        self.presentViewController(vc, animated: true, completion: nil)
    
    } // logoutButton()
    
} // SettingsViewController
