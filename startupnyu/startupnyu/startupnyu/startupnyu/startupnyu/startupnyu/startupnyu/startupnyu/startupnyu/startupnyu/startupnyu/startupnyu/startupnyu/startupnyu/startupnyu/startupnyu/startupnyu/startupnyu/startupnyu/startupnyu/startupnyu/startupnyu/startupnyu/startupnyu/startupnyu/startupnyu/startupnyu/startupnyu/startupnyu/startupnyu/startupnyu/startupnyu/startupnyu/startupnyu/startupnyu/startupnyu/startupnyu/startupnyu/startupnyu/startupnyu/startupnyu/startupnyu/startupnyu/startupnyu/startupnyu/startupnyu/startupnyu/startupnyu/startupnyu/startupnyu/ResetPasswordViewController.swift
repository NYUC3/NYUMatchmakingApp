//
//  DataTableViewController.swift
//  startupnyu
//
//  Created by Jay Kumar on 1/16/16.
//  Copyright © 2016 Polymafia. All rights reserved.
//

import UIKit
import Parse

class ResetPasswordViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBAction func passwordReset(sender: AnyObject) {
        var email = self.emailField.text
        var finalEmail = email!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        // Send a request to reset a password
        PFUser.requestPasswordResetForEmailInBackground(finalEmail)
        
        var alert = UIAlertController (title: "Password Reset", message: "An email containing information on how to reset your password has been sent to " + finalEmail + ".", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
