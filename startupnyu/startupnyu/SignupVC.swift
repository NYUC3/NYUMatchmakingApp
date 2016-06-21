//
//  SignupVC.swift
//  startupnyu
//
//  Created by Vidyadhar V. Thatte on 4/25/16.
//  Copyright © 2016 Polymafia. All rights reserved.
//

import UIKit
import Parse

class SignupVC: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background-login.png")!)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    
    @IBAction func DoneButtonTapped(sender: UIButton) {
        
        if(nameTextField.text != "" && passwordTextField.text != "" && confirmPasswordTextField.text != ""){
        
            if( passwordTextField.text == confirmPasswordTextField.text ){
                
                var user = PFUser()
                user.username = nameTextField.text
                user.email = nameTextField.text
                user.password = passwordTextField.text
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewControllerWithIdentifier("mainTab") as! CustomTabbar
                self.presentViewController(vc, animated: true, completion: nil)

                
                user.signUpInBackgroundWithBlock {
                    (succeeded: Bool, error: NSError?) -> Void in
                    if let error = error {
                        let errorString = error.userInfo["error"] as? NSString
                        // Show the errorString somewhere and let the user try again.

                    } else {
                        // Hooray! Let them use the app now.
                    }
                }
                
            }
                
            else{
                
                let alert = UIAlertController(title: "Re-enter Password", message: "Passwords don't match", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Re-try", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            
            }
        }
            
        else{
            
            let alert = UIAlertController(title: "Blank Fields", message: "Please complete all fields", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        
        }
    }
    

}
