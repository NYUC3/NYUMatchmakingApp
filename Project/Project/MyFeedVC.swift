//
//  MyFeedVC.swift
//  Project
//
//  Created by Vidyadhar V. Thatte on 9/21/16.
//  Copyright © 2016 Vidyadhar Thatte. All rights reserved.
//

import UIKit

class MyFeedVC: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logo = UIImage(named: "main-logo")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
