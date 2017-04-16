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
    

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var projectsTable: UITableView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var createActivityButton: UIButton!
    @IBOutlet weak var createProjectButton: UIButton!

    var projects = [Feed]()
    var feed = [Feed]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Avenir", size: 20)!]

        //self.navigationController?.navigationBar.tintColor = UIColor.white
        
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
                                
                                let project = Feed(name: object["Name"] as! String, title: "", desc: object["Description"] as! String, image: theImg, likes: 0)

                                self.projects.append(project)
                            }
                        }
                    }
                    
                    if(self.projects.count == 0){
                        self.projectsTable.isHidden = true
                        self.createActivityButton.isEnabled = false
                        self.infoLabel.text = "Create a New Project!"
                        
                    }
                    else{
                        self.createActivityButton.isEnabled = true
                        self.projectsTable.isHidden = false
                    }
                    
                    self.queryActivity()
                    self.projectsTable.reloadData()
                }
            }
        }
    }

    
    func queryActivity(){
    
        let query = PFQuery(className:"MyActivities")
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
                                
                                let project = Feed(name: object["activityName"] as! String, title: "", desc: object["activityDescription"] as! String, image: theImg, likes: 0)
                                
                                self.feed.append(project)
                            }
                            
                        }
                    }
                    
                }
            }
        }
    }
    

    @IBAction func unwindToProjects(segue: UIStoryboardSegue) {
        // some code to execute
    } // unwindToPrevious
    
    // Tableview delegate functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        if(self.segmentControl.selectedSegmentIndex == 0){
             return projects.count
        }
        else{
            return feed.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: "select-project", for: indexPath) as! HomeVCTableViewCell
        if(self.segmentControl.selectedSegmentIndex == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "my-project", for: indexPath) as UITableViewCell
            cell.textLabel?.text = projects[indexPath.row].name
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "my-project", for: indexPath) as UITableViewCell
            cell.textLabel?.text = feed[indexPath.row].name
            return cell
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "view-project"){
            
            let destinationNavigationController = segue.destination as! UINavigationController
            let targetController = destinationNavigationController.topViewController as! ProjectViewController
            targetController.projectObject = projects[(projectsTable.indexPathForSelectedRow?.row)!]
            
        }
        else if(segue.identifier == "view-activity"){
            
        }
    }

    @IBAction func logoutTapped(_ sender: UIBarButtonItem) {
        PFUser.logOut()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "landingvc") as! LandingPageViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func segmentControlTapped(_ sender: UISegmentedControl) {
        self.projectsTable.reloadData()
    }


}
