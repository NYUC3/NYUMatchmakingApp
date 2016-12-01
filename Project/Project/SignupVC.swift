//
//  SignupVC.swift
//  Project
//
//  Created by Vidyadhar V. Thatte on 10/6/16.
//  Copyright © 2016 Vidyadhar Thatte. All rights reserved.
//

import UIKit
import Parse

class SignupVC: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmpassword: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SignupTappd(_ sender: UIButton) {
        
        let user = PFUser()
        user.username = email.text
        user.password = password.text
        user.email = email.text

        
        user.signUpInBackground {
            (succeeded: Bool, error: Error?) -> Void in
            if let error = error {
                
                let alertController = UIAlertController(title: "Something went wrong!", message:
                    error.localizedDescription , preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                self.present(alertController, animated: true, completion: nil)

            } else {
                // Hooray! Let them use the app now.
                print("logged in successfully")
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "mainTabBar") as! CustomTabbarVC
                self.present(vc, animated: true, completion: nil)
            }
        }
        
    }
    

}
