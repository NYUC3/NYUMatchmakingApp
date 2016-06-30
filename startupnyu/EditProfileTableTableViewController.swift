//
//  EditProfileTableTableViewController.swift
//  startupnyu
//
//  Created by Vidyadhar V. Thatte on 3/19/16.
//  Copyright © 2016 Polymafia. All rights reserved.
//

import UIKit

class EditProfileTableTableViewController: UITableViewController {

    @IBOutlet weak var profileImageView: UIImageView!                   // profile image
    @IBOutlet weak var nameTextField: UITextField!                      // name field
    @IBOutlet weak var titleTextField: UITextField!                     // title text field
    @IBOutlet weak var bioTextField: UITextView!                        // bio text field
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    } // viewDidLoad(_)

    @IBAction func uploadProfileImageButtonTapped(sender: UIButton) {
        
        
        
    } // uploadProfileImageButtonTapped(_)
    
    
    
    @IBAction func cancelButtonTapped(sender: UIBarButtonItem) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    } // cancelButtonTapped(_)
    
    
    
    @IBAction func saveButtonTapped(sender: UIBarButtonItem) {
        
        if(nameTextField.text != nil && titleTextField.text != nil && bioTextField.text != nil){
        
        
        } // if
        
        else{
            
            let alert = UIAlertController(title: "Save Failed", message: "Some of the fields are missing. Please fill up all the fields.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
        } // else
        
    } // saveButtonTapped(_)
    
    
} // EditProfileTableViewController
