//
//  CreateProjectViewController.swift
//  startupnyu
//
//  Created by Vidyadhar V. Thatte on 3/19/16.
//  Copyright © 2016 Polymafia. All rights reserved.
//

import UIKit

class CreateProjectViewController: UITableViewController, UIImagePickerControllerDelegate{
    
    @IBOutlet weak var projectImageView: UIImageView!                   // Image
    @IBOutlet weak var projectName: UITextField!                        // Name
    @IBOutlet weak var aboutTextField: UITextView!                      // About text field
    @IBOutlet weak var requirementsTextField: UITextView!               // Requirements text field
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }//viewDidLoad()

    
    
    @IBAction func uploadImageTapped(sender: UIButton) {
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
        
    } // uploadImageTapped(_)
    
    
    
    @IBAction func cancelButtonTapped(sender: AnyObject) {
        
    } // cancelButtonTapped(_)
    
    
    
    @IBAction func saveButtonTapped(sender: UIButton) {
        
        if(projectName.text != nil && aboutTextField.text != nil && requirementsTextField.text != nil){
            
            // all fields are correctly filled - or are they?

        } // if
        
        else{
            
            // one or more fields are left empty - alert the user
            
            let alert = UIAlertController(title: "Save Failed", message: "Some of the fields are missing. Please fill up all the fields.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        
        } // else
        
    } // saveButtonTapped(_)
    
    
    
    @IBAction func cancelButton(sender: UIButton) {
        
        navigationController?.popToRootViewControllerAnimated(true)
        
    } // cancelButton(_)
    
    
    // MARK:- Image Picker View Methods
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            projectImageView.contentMode = .ScaleAspectFit
            projectImageView.image = pickedImage
        } //if
        
        dismissViewControllerAnimated(true, completion: nil)
        tableView.reloadData()
    } //imagePickerController(_)
    
    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        dismissViewControllerAnimated(true, completion: nil)
    
    } //imagePickerControllerDidCancel(_)
    
    
} // CreateProjectViewController
