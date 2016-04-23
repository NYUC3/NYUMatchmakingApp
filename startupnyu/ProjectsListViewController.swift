//
//  ProjectsListViewController.swift
//  startupnyu
//
//  Created by Vidyadhar V. Thatte on 4/7/16.
//  Copyright © 2016 Polymafia. All rights reserved.
//

import UIKit
import Parse

class ProjectsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    var projectsList : Array<MyProjectStruct> = [] // Note: ExploreStruct is a shitty name pls change

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // TO DO: Load user's projects into projectsList
        
        var query = PFQuery(className:"Project")
        query.whereKey("email", equalTo:(PFUser.currentUser()?.email)!)
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects
                if let objects = objects {
                    for object in objects {
                        
                        
                        let projectObject = MyProjectStruct(name: object["Name"] as! String, tags: object["Tags"] as! String, image: object["Image"] as! PFFile)
                        self.projectsList.append(projectObject)
                        
                        self.tableView.reloadData()
                        
                    }
                }
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }

        
        
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return projectsList.count + 1
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        if(indexPath.row == projectsList.count){
            let cell = tableView.dequeueReusableCellWithIdentifier("addbutton", forIndexPath: indexPath) as! AddButtonTableViewCell
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCellWithIdentifier("createproject", forIndexPath: indexPath) as! MyProjectsTableViewCell
            
            cell.projectName.text = projectsList[indexPath.row].name
            cell.projectName.text = projectsList[indexPath.row].tags
            return cell
        }

    }


}
