//
//  ProjectViewController.swift
//  Project
//
//  Created by Vidyadhar V. Thatte on 10/20/16.
//  Copyright © 2016 Vidyadhar Thatte. All rights reserved.
//

import UIKit
import Parse

class ProjectViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    @IBOutlet weak var projectImage: UIImageView!
    @IBOutlet weak var projectDescription: UILabel!
    @IBOutlet weak var followButton: UIButton!

    var projectOject : Feed?
    var isFollowing : Bool = false
    
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
2
            } else {
                // Log details of the failure
                print("Error: \(error!)")
            }
        }
        
        
    }
    
    // UICollectionview datasource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 5
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collection-cell", for: indexPath)
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
