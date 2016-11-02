//
//  ProjectViewController.swift
//  Project
//
//  Created by Vidyadhar V. Thatte on 10/20/16.
//  Copyright © 2016 Vidyadhar Thatte. All rights reserved.
//

import UIKit

class ProjectViewController: UIViewController {
    
    
    
    @IBOutlet weak var projectImage: UIImageView!
    @IBOutlet weak var projectName: UILabel!
    @IBOutlet weak var projectDescription: UILabel!

    var projectOject : Feed?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let imageFromParse = projectOject?.image
        imageFromParse!.getDataInBackground(block: { (imageData: Data?, error: Error?) -> Void in
            let image: UIImage! = UIImage(data: imageData!)!
            self.projectImage.image = image
            self.title = self.projectOject?.name
        })
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
