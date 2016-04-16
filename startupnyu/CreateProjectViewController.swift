//
//  CreateProjectViewController.swift
//  startupnyu
//
//  Created by Vidyadhar V. Thatte on 3/19/16.
//  Copyright © 2016 Polymafia. All rights reserved.
//
import Parse
import UIKit

class CreateProjectViewController: UITableViewController, UIImagePickerControllerDelegate{
    
    @IBOutlet weak var projectImageView: UIImageView!
    @IBOutlet weak var projectName: UITextField!
    @IBOutlet weak var aboutTextField: UITextView!
    @IBOutlet weak var requirementsTextField: UITextView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func uploadImageTapped(sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonTapped(sender: AnyObject) {
        
    }
    
    @IBAction func saveButtonTapped(sender: UIButton) {
        
        if(projectName.text != nil && aboutTextField.text != nil && requirementsTextField.text != nil && projectImageView.image != nil){
            
            var newProject = PFObject(className:"Project")
            
            // TO DO: TAGS, ABOUT, REQUIREMENTS
            
            newProject["email"] = ""
            newProject["name"] = projectName.text
            newProject["image"] = projectImageView.image
            
            newProject.saveInBackgroundWithBlock {
                (success: Bool, error: NSError?) -> Void in
                if (success) {
                    // The object has been saved.
                    self.dismissViewControllerAnimated(true, completion: nil)
                } else {
                    // There was a problem, check error.description
                }
            }
        
        }
        
        else{
            
            let alert = UIAlertController(title: "Save Failed", message: "Some of the fields are missing. Please fill up all the fields.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        
        }
        

        
        
    }
    
    @IBAction func cancelButton(sender: UIButton) {
        
        navigationController?.popToRootViewControllerAnimated(true)
        
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            projectImageView.contentMode = .ScaleAspectFit
            projectImageView.image = pickedImage
        }
        
        dismissViewControllerAnimated(true, completion: nil)
        tableView.reloadData()
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
