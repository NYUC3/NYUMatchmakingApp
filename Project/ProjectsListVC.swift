//
//  ProjectsListVC.swift
//  Project
//
//  Created by Vidyadhar V. Thatte on 9/30/16.
//  Copyright © 2016 Vidyadhar Thatte. All rights reserved.
//

import UIKit
import Parse

class ProjectsListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var projectsTable: UITableView!

    var projects = [Feed]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.emailLabel.text = PFUser.current()?.email
        
        
        let query = PFQuery(className:"Projects")
        query.whereKey("username", equalTo:PFUser.current()?.email)
        query.findObjectsInBackground {
            (objects: [PFObject]?, error: Error?) -> Void in
            
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects
                if let objects = objects {
                    for object in objects {
                        
                        if(object["image"] != nil){
                            let theImg = object["image"] as! PFFile
                            if(theImg != nil){
                                
                                let project = Feed(name: object["Name"] as! String, title: "", desc: object["Description"] as! String, image: theImg)
                                //let project = Project(name: object["Name"] as! String, desc: object["Description"] as! String, image: theImg)
                                self.projects.append(project)
                            }
                            
                        }
                    }
                   self.projectsTable.reloadData()
                }
            }
        }
    }


    @IBAction func unwindToProjects(segue: UIStoryboardSegue) {
        // some code to execute
    } // unwindToPrevious
    
    // Tableview delegate functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    
        return projects.count
        
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "select-project", for: indexPath)
        cell.textLabel?.text = projects[indexPath.row].name
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "view-project"){
            
            let destinationNavigationController = segue.destination as! UINavigationController
            let targetController = destinationNavigationController.topViewController as! ProjectViewController
            targetController.projectOject = projects[(projectsTable.indexPathForSelectedRow?.row)!]
            
        }
    }



}
