//
//  CreateNewActivityVC.swift
//  Project
//
//  Created by Vidyadhar V. Thatte on 9/21/16.
//  Copyright © 2016 Vidyadhar Thatte. All rights reserved.
//

import UIKit
import Parse

class CreateNewActivityVC: UIViewController, UIImagePickerControllerDelegate {
    
    
    @IBOutlet weak var projectNameLabel: UITextField!
    @IBOutlet weak var activityLabel: UITextField!
    @IBOutlet weak var actvityDescription: UITextField!
    @IBOutlet weak var feedUploadImage: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }

    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        let activity = PFObject(className:"MyActivities")
        activity["projectName"] = projectNameLabel.text
        activity["activityName"] = activityLabel.text
        activity["activityDescription"] = actvityDescription.text
        activity["username"] = "vdthatte@nyu.edu"
        
        activity["image"] = PFFile(data: UIImageJPEGRepresentation(self.feedUploadImage.image!, 0.1)!)
        activity.saveInBackground()
        dismiss(animated: true, completion: nil)
    }

    @IBAction func uploadButton(_ sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            feedUploadImage.contentMode = .scaleAspectFit
            feedUploadImage.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
}
