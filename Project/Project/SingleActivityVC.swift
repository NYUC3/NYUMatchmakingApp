//
//  SingleActivityVC.swift
//  Project
//
//  Created by Vidyadhar V. Thatte on 11/30/16.
//  Copyright © 2016 Vidyadhar Thatte. All rights reserved.
//

import UIKit

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

    }
    
    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    


}
