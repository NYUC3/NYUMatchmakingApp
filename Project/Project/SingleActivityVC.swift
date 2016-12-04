//
//  SingleActivityVC.swift
//  Project
//
//  Created by Vidyadhar V. Thatte on 11/30/16.
//  Copyright © 2016 Vidyadhar Thatte. All rights reserved.
//

import UIKit
import Parse

class SingleActivityVC: UIViewController {
    
    var activityObject : Feed?
    @IBOutlet weak var activityTitleLabel: UILabel!
    @IBOutlet weak var activityDescriptionLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var activityImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {

        let imageFromParse = activityObject?.image
        imageFromParse!.getDataInBackground(block: { (imageData: Data?, error: Error?) -> Void in
            let image: UIImage! = UIImage(data: imageData!)!
            self.activityImage.image = image
            self.activityDescriptionLabel.text = self.activityObject?.description
            self.activityTitleLabel.text = self.activityObject?.title
        })
        
        let query = PFQuery(className:"likes")
        query.whereKey("username", equalTo: (PFUser.current()?.username)!)
        //query.whereKey("project", equalTo: projectOject?.name)
        query.findObjectsInBackground {
            (objects: [PFObject]?, error: Error?) -> Void in
            
            if error == nil {
                // The find succeeded.
                if let objects = objects {
                    for object in objects {
                        if(object["title"] as? String == self.activityTitleLabel.text){
                            let filledImage = UIImage(named: "heart-black-filled")
                            self.likeButton.setImage(filledImage, for: .normal)
                        }
                    }
                }
                
            } else {
                // Log details of the failure
                print("Error: \(error!)")
            }
        }

    }
    
    @IBAction func likeButtonTapped(_ sender: UIButton) {
        
        
        
    }
    
    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }

}
