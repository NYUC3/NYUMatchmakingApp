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
    

    @IBOutlet weak var projectsTable: UITableView!

    var projects = [Feed]()
    
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
        
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: "select-project", for: indexPath) as! HomeVCTableViewCell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "my-project", for: indexPath) as! UITableViewCell
        cell.textLabel?.text = projects[indexPath.row].name
        cell.textLabel?.font = UIFont(name: "Avenir", size: 20)
        
        
        //let gradient = CAGradientLayer()
        //gradient.frame = view.bounds
        //gradient.colors = [UIColor.black.cgColor, UIColor.clear.cgColor]
        //cell.projectImage.layer.insertSublayer(gradient, at: 0)
        //cell.pr.layer.insertSublayer(gradient, at: 0)
        //self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Avenir", size: 25)!]
        
        
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "view-project"){
            
            let destinationNavigationController = segue.destination as! UINavigationController
            let targetController = destinationNavigationController.topViewController as! ProjectViewController
            targetController.projectObject = projects[(projectsTable.indexPathForSelectedRow?.row)!]
            
        }
    }

    @IBAction func logoutTapped(_ sender: UIBarButtonItem) {
        PFUser.logOut()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "landingvc") as! LandingPageViewController
        self.present(vc, animated: true, completion: nil)
    }
    


}
