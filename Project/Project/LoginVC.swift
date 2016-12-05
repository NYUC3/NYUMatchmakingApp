//
//  LoginVC.swift
//  Project
//
//  Created by Vidyadhar V. Thatte on 10/6/16.
//  Copyright © 2016 Vidyadhar Thatte. All rights reserved.
//

import UIKit
import Parse

class LoginVC: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func LoginTapped(_ sender: UIButton) {
        
        if(email.text != "" && password.text != ""){
            
            PFUser.logInWithUsername(inBackground: email.text!, password:password.text!) {
                (user: PFUser?, error: Error?) -> Void in
                if user != nil {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "mainTabBar") as! UITabBarController
                    self.present(vc, animated: true, completion: nil)
                }
                    
                else {
                    // The login failed. Check error to see why.
                    let alertController = UIAlertController(title: "Something went wrong!", message:
                        error.debugDescription , preferredStyle: UIAlertControllerStyle.alert)
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
        else{
        
            let alert = UIAlertController(title: "Fields Empty", message: "One of the fields are empty. Please make sure all the fields are full.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        
        }
        


    }
    
    
    
    @IBAction func unwindToLogin(segue: UIStoryboardSegue) {
        // some code to execute
    } // unwindToPrevious

}
