//
//  ProjectViewController.swift
//  Project
//
//  Created by Vidyadhar V. Thatte on 10/20/16.
//  Copyright © 2016 Vidyadhar Thatte. All rights reserved.
//

import UIKit
import Parse

class ProjectViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var projectImage: UIImageView!
    @IBOutlet weak var projectDescription: UILabel!
    @IBOutlet weak var followButton: UIButton!

    var projectOject : Feed?
    var isFollowing : Bool = false
    
    var activities : [Feed] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let imageFromParse = projectOject?.image
        imageFromParse!.getDataInBackground(block: { (imageData: Data?, error: Error?) -> Void in
            let image: UIImage! = UIImage(data: imageData!)!
            self.projectImage.image = image
            self.title = self.projectOject?.name
            self.projectDescription.text = self.projectOject?.description
        })
        
        
        self.projectDescription.numberOfLines = 0
        self.projectDescription.lineBreakMode = .byWordWrapping
        
        let query = PFQuery(className:"Follow")
        query.whereKey("username", equalTo: (PFUser.current()?.username)!)
        //query.whereKey("project", equalTo: projectOject?.name)
        query.findObjectsInBackground {
            (objects: [PFObject]?, error: Error?) -> Void in
            
            if error == nil {
                // The find succeeded.
                if let objects = objects {
                    for object in objects {
                        if(object["project"] as? String == self.projectOject?.name){
                            self.isFollowing = true
                            self.followButton.setTitle("Following", for: .normal)
                        }
                    }
                }

            } else {
                // Log details of the failure
                print("Error: \(error!)")
            }
        }
        
        
        let queryActivities = PFQuery(className:"MyActivities")
        queryActivities.whereKey("projectName", equalTo: self.projectOject?.name)
        queryActivities.findObjectsInBackground {
            (objects: [PFObject]?, error: Error?) -> Void in
            
            if error == nil {
                // The find succeeded.
                if let objects = objects {
                    for object in objects {
                        
                        if(object["image"] != nil){
                           
                            let theImg = object["image"] as! PFFile
                            
                            if(theImg != nil){

                                
                                
                                let feed = Feed(name: object["projectName"] as! String, title: object["activityName"] as! String, desc: object["activityDescription"] as! String, image: theImg, likes:0)
                                
                                
                                self.activities.append(feed)
                            }
                        
                        }
                    }
                }
                
            } else {
                // Log details of the failure
                print("Error: \(error!)")
            }
        }
        
        
    }
    
    
    // table view stuff
    

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return activities.count
    
    }

    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "project-activity-cell", for: indexPath)
        cell.textLabel?.text = activities[indexPath.row].name
        cell.textLabel?.font = UIFont(name: "Avenir", size: 18)
        return cell
        
    }

    




    @IBAction func followButtonTapped(_ sender: UIButton) {
        
        if(!isFollowing){
            isFollowing = true
            followButton.setTitle("Following", for: .normal)
            let followClass = PFObject(className:"Follow")
            followClass["username"] = PFUser.current()?.username
            followClass["project"] = projectOject?.name
            
            followClass.saveInBackground {
                (success: Bool, error: Error?) -> Void in
                if (success) {
                    // The object has been saved.
                } else {
                    // There was a problem, check error.description
                }
            }
        
        }
        else{
            followButton.setTitle("Follow", for: .normal)
            
            // delete the follow object from
            
            let query = PFQuery(className:"Follow")
            query.whereKey("username", equalTo: (PFUser.current()?.username)!)
            //query.whereKey("project", equalTo: projectOject?.name)
            query.findObjectsInBackground {
                (objects: [PFObject]?, error: Error?) -> Void in
                
                if error == nil {
                    // The find succeeded.
                    if let objects = objects {
                        for object in objects {
                            if(object["project"] as? String == self.projectOject?.name){
                                object.deleteInBackground()
                                self.isFollowing = false
                            }
                        }
                    }
                } else {
                    // Log details of the failure
                    print("Error: \(error!)")
                }
            }
        
        }
        
    }

}
