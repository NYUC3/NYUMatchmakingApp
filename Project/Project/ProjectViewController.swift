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
        
        
        let follow = PFObject(className:"Follow")
        follow["username"] = PFUser.current()?.username
        follow["project"] = self.projectObject?.name
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

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
}
