//
//  DataTableViewController.swift
//  startupnyu
//
//  Created by Jay Kumar on 1/16/16.
//  Copyright © 2016 Polymafia. All rights reserved.
//

import UIKit
import Parse

class HomeViewController: UIViewController {
    
    //didn't segue the HomeViewController and don't know why I included the password + email buttons
    //forgot how the UI looked like, modified a template and tried to match as close as I could
    
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBAction func logOutAction(sender: AnyObject){
        
        // Send a request to log out a user
        PFUser.logOut()
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Login") 
            self.presentViewController(viewController, animated: true, completion: nil)
        })
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Show the current visitor's username
        if let pUserName = PFUser.currentUser()?["username"] as? String {
            self.userNameLabel.text = "@" + pUserName
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        if (PFUser.currentUser() == nil) {
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                
                let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Login")
                self.presentViewController(viewController, animated: true, completion: nil)
            })
        }
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
