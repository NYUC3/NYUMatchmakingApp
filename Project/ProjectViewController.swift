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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
