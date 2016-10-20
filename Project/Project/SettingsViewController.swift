//
//  SettingsViewController.swift
//  Project
//
//  Created by Vidyadhar V. Thatte on 10/19/16.
//  Copyright © 2016 Vidyadhar Thatte. All rights reserved.
//

import UIKit
import Parse

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoutTapped(_ sender: UIButton) {
        PFUser.logOut()
        //self.dismiss(animated: true, completion: nil)
    }


}
