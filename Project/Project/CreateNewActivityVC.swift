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
    @IBOutlet weak var activityDescription: UITextView!
    @IBOutlet weak var feedUploadImage: UIImageView!
    @IBOutlet weak var projectNamePickerView: UIPickerView!
    
    let imagePicker = UIImagePickerController()
    
    var activity : Feed?
    var isEdit = false

    var projectNames = [String]()
    
    var selectedProjectName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //selectedProjectName = projectNames[0]
        imagePicker.delegate = self
        
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Avenir", size: 20)!]

        
        if isEdit{
            self.activityLabel.text = activity?.title
            self.activityDescription.text = activity?.description
            
            let imageFromParse = activity?.image
            imageFromParse!.getDataInBackground(block: { (imageData: Data?, error: Error?) -> Void in
                
                if(imageData != nil){
                    let image: UIImage! = UIImage(data: imageData!)!
                    self.feedUploadImage.image = cropToBounds(image: image, width: 375.0, height: 222.0)
                }
            })
        }
        
        
        
        let query = PFQuery(className:"Projects")
        query.whereKey("username", equalTo: (PFUser.current()?.username)!)
        query.findObjectsInBackground {
            (objects: [PFObject]?, error: Error?) -> Void in
            
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects
                if let objects = objects {
                    for object in objects {
                        self.projectNames.append(object["Name"] as! String)
                    }
                    self.selectedProjectName = self.projectNames[0]
                    print(self.projectNames)
                    self.projectNamePickerView.reloadAllComponents()
                }
            } else {
                // Log details of the failure
                print("Error: \(error!)")
            }
        }
        

    }

    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }

    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        if(self.isEdit){
            self.saveEdit()
        }
        else{
            let activity = PFObject(className:"MyActivities")
            activity["projectName"] = selectedProjectName
            activity["activityName"] = activityLabel.text
            activity["activityDescription"] = activityDescription.text
            activity["username"] = (PFUser.current()?.username)!
            
            activity["image"] = PFFile(data: UIImageJPEGRepresentation(self.feedUploadImage.image!, 0.1)!)
            activity.saveInBackground()
        }

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
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return projectNames[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        selectedProjectName = projectNames[row]
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func saveEdit(){
        
        let query = PFQuery(className:"MyActivities")
        query.getObjectInBackground(withId: (activity?.objectId)!) {
            (object: PFObject?, error: Error?) -> Void in
            if error == nil && object != nil {
                
                object?["projectName"] = self.selectedProjectName
                object?["activityName"] = self.activityLabel.text
                object?["activityDescription"] = self.activityDescription.text
                object?["image"] = PFFile(data: UIImageJPEGRepresentation(self.feedUploadImage.image!, 0.1)!)
                object?.saveInBackground()
                
            }
                
            else {
                
                print(error.debugDescription)
                
            }
        }
        
        
    
    }
    
}

