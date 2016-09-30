//
//  HomeViewController.swift
//  Project
//
//  Created by Vidyadhar V. Thatte on 9/21/16.
//  Copyright © 2016 Vidyadhar Thatte. All rights reserved.
//

import UIKit
import Parse

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var projectsList = [Project]()
    
    @IBOutlet weak var projectTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var query = PFQuery(className:"Projects")
        query.whereKey("username", equalTo:"vdthatte@nyu.edu")
        query.findObjectsInBackground {
            (objects: [PFObject]?, error: Error?) -> Void in
            
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects
                if let objects = objects {
                    for object in objects {
                        
                        
                        let project = Project(name: object["Name"] as! String, desc: object["Description"] as! String, image: object["image"] as! PFFile)
                        
                        self.projectsList.append(project)
                    }
                }
                
                self.projectTableView.reloadData()
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error! as! NSError)")
            }
        }
        
        
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return projectsList.count
    }
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "home-cell", for: indexPath) as! HomeVCTableViewCell
        cell.projectName.text = projectsList[indexPath.row].name
        cell.descriptionLabel.text = projectsList[indexPath.row].description
        
        //var imageFromParse = projectsList[indexPath.row].image
        //cell.projectImage.image = imageFromParse
        

        
        return cell
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
