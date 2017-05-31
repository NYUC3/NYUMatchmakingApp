//
//  ProjectViewController.swift
//  Project
//
//  Created by Vidyadhar V. Thatte on 4/13/17.
//  Copyright © 2017 Vidyadhar Thatte. All rights reserved.
//

import UIKit
import Parse

class ProjectViewController: UIViewController {
    
    var projectObject : Feed?

    @IBOutlet weak var projectImageView: UIImageView!
    @IBOutlet weak var projectName: UILabel!
    @IBOutlet weak var projectDescription: UITextView!
    @IBOutlet weak var followButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logo = UIImage(named: "main-logo")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
        self.projectName.text = projectObject?.name
        self.projectDescription.text = projectObject?.description
        
        let imageFromParse = self.projectObject?.image
        imageFromParse!.getDataInBackground(block: { (imageData: Data?, error: Error?) -> Void in
            let image: UIImage! = UIImage(data: imageData!)!
            self.projectImageView.image = image
        })
        
    }
    
    
    
    
    @IBAction func followTapped(_ sender: UIButton) {
        
        if(self.followButton.titleLabel?.text == "follow"){
            
            self.followButton.setTitle("unfollow", for: .normal)
            
            let follow = PFObject(className:"Follow")
            follow["username"] = PFUser.current()?.username
            follow["project"] = self.projectObject?.name
            follow["projectId"] = self.projectObject?.objectId
            follow.saveInBackground {
                (success: Bool, error: Error?) -> Void in
                if (success) {
                    // The object has been saved.
                    print("Follow object saved successfully")
                } else {
                    // There was a problem, check error.description
                    print("Follow object save error : \(error.debugDescription)")
                }
            }
        }
        else{
            
            self.followButton.setTitle("follow", for: .normal)
            
            
            let query = PFQuery(className:"Follow")
            query.whereKey("projectId", equalTo: projectObject?.objectId)
            query.findObjectsInBackground(block: {
                (objects: [PFObject]?, error: Error?) -> Void in
                
                if error == nil {
                    // The find succeeded.
                    print("Successfully retrieved \(objects!.count) scores.")
                    // Do something with the found objects
                    if let objects = objects {
                        for object in objects {
                            object.deleteInBackground()
                        }
                    }
                } else {
                    // Log details of the failure
                    print("Error: \(error!)")
                }
            })
            
            
        }
    
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        let query = PFQuery(className:"Follow")
        query.whereKey("projectId", equalTo: projectObject?.objectId)
        query.findObjectsInBackground(block: {
            (objects: [PFObject]?, error: Error?) -> Void in
            
            if error == nil {

                if let objects = objects {
                    for object in objects{
                        if(object["username"] as? String == PFUser.current()?.username){
                            self.followButton.setTitle("unfollow", for: .normal)
                        }
                    }
                }
                
            }
            else {
                print("Error: \(error!.localizedDescription)")
            }
        })
    }
    
}
