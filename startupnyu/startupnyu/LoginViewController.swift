//
//  LoginViewController.swift
//  startupnyu
//
//  Created by Vidyadhar V. Thatte on 1/25/16.
//  Copyright © 2016 Polymafia. All rights reserved.
//

import UIKit
import Parse
import AWSCore
import AWSS3
import AWSDynamoDB
import AWSSQS
import AWSSNS
import AWSCognito


class LoginViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LoginButton(sender: UIButton) {
        PFUser.logInWithUsernameInBackground(username.text! , password:password.text!) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                // Do stuff after successful login.
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewControllerWithIdentifier("mainTab") as! CustomTabbar
                self.presentViewController(vc, animated: true, completion: nil)
            } else {
                // The login failed. Check error to see why.
                let alert = UIAlertController(title: "Something Went Wrong", message: "Please try again!", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func unwindTologinup(segue: UIStoryboardSegue) {
        // some code to execute
    } // unwindToPrevious


}
