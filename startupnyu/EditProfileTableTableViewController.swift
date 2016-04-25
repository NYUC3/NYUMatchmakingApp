//
//  EditProfileTableTableViewController.swift
//  startupnyu
//
//  Created by Vidyadhar V. Thatte on 3/19/16.
//  Copyright © 2016 Polymafia. All rights reserved.
//

import UIKit
import Parse

class EditProfileTableTableViewController: UITableViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bioTextField: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    @IBAction func uploadProfileImageButtonTapped(sender: UIButton) {
        
        
        
    }
    
    
    
    @IBAction func cancelButtonTapped(sender: UIBarButtonItem) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    @IBAction func saveButtonTapped(sender: UIBarButtonItem) {
        
        if(nameTextField.text != nil && titleTextField.text != nil && bioTextField.text != nil){
            
            var query = PFQuery(className:"Student")
            query.whereKey("email", equalTo:(PFUser.currentUser()?.email)!)
            query.findObjectsInBackgroundWithBlock {
                (objects: [PFObject]?, error: NSError?) -> Void in
                
                if error == nil {
                    // The find succeeded.
                    print("Successfully retrieved \(objects!.count) scores.")
                    // Do something with the found objects
                    if let objects = objects {
                        for object in objects {
                            
                            
                            object["FirstName"] = self.nameTextField.text
                            object["OneLineDescription"] = self.titleTextField.text
                            object["bio"] = self.bioTextField.text
                            
                            do{
                            
                                try object.save()
                                self.dismissViewControllerAnimated(true, completion: nil)
                            
                            }
                            catch{
                                self.dismissViewControllerAnimated(true, completion: nil)
                                
                                let alert = UIAlertController(title: "Save Failed", message: "Something went wrong", preferredStyle: UIAlertControllerStyle.Alert)
                                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                                self.presentViewController(alert, animated: true, completion: nil)
                            
                            }
                            
                        }
                    }
                } else {
                    // Log details of the failure
                    print("Error: \(error!) \(error!.userInfo)")
                }
            }

        
        
        }
        
            
        else{
            
            let alert = UIAlertController(title: "Save Failed", message: "Some of the fields are missing. Please fill up all the fields.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
        }
        
        
        
    }
    
    
    
}
