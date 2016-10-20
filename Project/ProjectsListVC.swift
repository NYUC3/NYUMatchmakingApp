//
//  ProjectsListVC.swift
//  Project
//
//  Created by Vidyadhar V. Thatte on 9/30/16.
//  Copyright © 2016 Vidyadhar Thatte. All rights reserved.
//

import UIKit
import Parse

class ProjectsListVC: UIViewController {

    var projects = [Project]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToProjects(segue: UIStoryboardSegue) {
        // some code to execute
    } // unwindToPrevious


}
