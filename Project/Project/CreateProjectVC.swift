//
//  CreateProjectVC.swift
//  Project
//
//  Created by Vidyadhar V. Thatte on 9/30/16.
//  Copyright © 2016 Vidyadhar Thatte. All rights reserved.
//

import UIKit
import Parse

class CreateProjectVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var projectImageView: UIImageView!
    @IBOutlet weak var projectNameTextField: UITextField!
    @IBOutlet weak var projectDescriptionTextfield: UITextField!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self

        // Do any additional setup after loading the view.
    }

    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
        
        let activity = PFObject(className:"Projects")
        activity["Name"] = projectNameTextField.text
        activity["Description"] = projectDescriptionTextfield.text
        activity["username"] = "vdthatte@nyu.edu"
        
        activity["image"] = PFFile(data: UIImageJPEGRepresentation(self.projectImageView.image!, 0.1)!)
        activity.saveInBackground()
    }

    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func uploadButtonTapped(_ sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            projectImageView.contentMode = .scaleAspectFit
            projectImageView.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
}
