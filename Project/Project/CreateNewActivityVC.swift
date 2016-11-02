//
//  CreateNewActivityVC.swift
//  Project
//
//  Created by Vidyadhar V. Thatte on 9/21/16.
//  Copyright © 2016 Vidyadhar Thatte. All rights reserved.
//

import UIKit
import Parse

class CreateNewActivityVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    

    @IBOutlet weak var activityLabel: UITextField!
    @IBOutlet weak var actvityDescription: UITextField!
    @IBOutlet weak var feedUploadImage: UIImageView!
    @IBOutlet weak var projectNamePickerView: UIPickerView!
    
    let imagePicker = UIImagePickerController()
    
    var projectNames = [""]
    
    var selectedProjectName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedProjectName = projectNames[0]
        imagePicker.delegate = self
        
    }

    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }

    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {

        let activity = PFObject(className:"MyActivities")
        activity["projectName"] = selectedProjectName
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

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            feedUploadImage.contentMode = .scaleAspectFit
            print("PICKED IMAGE")
            print(pickedImage)
            feedUploadImage.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    // UIPickerView methods
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return projectNames.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return projectNames[row]
    }

    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        selectedProjectName = projectNames[row]
    }
    
}

