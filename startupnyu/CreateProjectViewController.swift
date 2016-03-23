//
//  CreateProjectViewController.swift
//  startupnyu
//
//  Created by Vidyadhar V. Thatte on 3/19/16.
//  Copyright © 2016 Polymafia. All rights reserved.
//

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
