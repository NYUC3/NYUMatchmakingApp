//
//  SignupVC.swift
//  startupnyu
//
//  Created by Vidyadhar V. Thatte on 4/25/16.
//  Copyright © 2016 Polymafia. All rights reserved.
//

import UIKit

class SignupVC: UIViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!                  // username
    @IBOutlet weak var passwordTextField: UITextField!              // password
    @IBOutlet weak var confirmPasswordTextField: UITextField!       // confirm password
    
    
    override func viewDidLoad() {
        
        // UI Customization
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background-login.png")!)
        
    }

    @IBAction func DoneButtonTapped(sender: UIButton) {
        
        if(nameTextField.text != "" && passwordTextField.text != "" && confirmPasswordTextField.text != ""){
            
            // none of the fields are left blank
            
            if( passwordTextField.text == confirmPasswordTextField.text ){
                
                // User has successfully completed all fields
                // Perform an automatic login now
                
                
                
                
            } //if
                
            else{
                
                // password and confirm password do not match
                // show alert view to warn the user
                
                let alert = UIAlertController(title: "Re-enter Password", message: "Passwords don't match", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Re-try", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            
            } //else
        } //if
            
        else{
            
            // one or more fields are left blank
            // show alert view to warn the user
            
            let alert = UIAlertController(title: "Blank Fields", message: "Please complete all fields", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        
        } //else
    }
    

}
