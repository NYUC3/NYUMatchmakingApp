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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func LoginTapped(_ sender: UIButton) {
        
        PFUser.logInWithUsername(inBackground: email.text!, password:password.text!) {
            (user: PFUser?, error: Error?) -> Void in
            if user != nil {
                // Do stuff after successful login.
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "homevc") as! HomeViewController
                self.present(vc, animated: true, completion: nil)
            } else {
                // The login failed. Check error to see why.
                let alertController = UIAlertController(title: "Something went wrong!", message:
                    error.debugDescription , preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                self.present(alertController, animated: true, completion: nil)
            }
        }

    }
    
    
    
    @IBAction func unwindToLogin(segue: UIStoryboardSegue) {
        // some code to execute
    } // unwindToPrevious

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
