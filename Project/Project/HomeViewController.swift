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

    var projectsList = [Feed]()
    var overlay : UIView? // loading screen
    
    @IBOutlet weak var projectTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Avenir", size: 20)!]
        
        if(PFUser.current() == nil){
            
            // present login screen
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "loginvc") as! LoginVC
            self.present(vc, animated: true, completion: nil)
            
        }
        else{
            
            // SETUP LOADING SCREEN
            overlay = UIView(frame: view.frame)
            overlay!.backgroundColor = UIColor.black
            overlay!.alpha = 0.8
            view.addSubview(overlay!)
            // END OF LOADING SCREEN SETUP
            
            let query = PFQuery(className:"Projects")

            query.order(byDescending: "createdAt")
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
                                
                                let q = PFQuery(className:"Follow")
                                //q.whereKey("username", equalTo: (PFUser.current()?.username)!)
                                q.whereKey("project", equalTo: object["Name"] as! String)
                                q.findObjectsInBackground {
                                    (objects: [PFObject]?, error: Error?) -> Void in
                                    
                                    if error == nil {
                                        // The find succeeded.
                                        if let objects = objects {
                                            let project = Feed(name: object["Name"] as! String, title: "", desc: object["Description"] as! String, image: theImg, likes: objects.count)
                                            self.projectsList.append(project)
                                        }
                                        self.projectTableView.reloadData()
                                        
                                    } else {
                                        // Log details of the failure
                                        print("Error: \(error!)")
                                    }
                                }

                            } // if
                    
                        } // if
                    }
                
                    self.projectTableView.reloadData()
                    self.overlay?.removeFromSuperview()
                }
             
                self.projectTableView.reloadData()
             
             }
             else {
                // Log details of the failure
                print("Error: \(error!) \(error! as NSError)")
                }
             }
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        projectTableView.reloadData()
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return projectsList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "home-cell", for: indexPath) as! HomeVCTableViewCell
        cell.projectName.text = projectsList[indexPath.row].name
        cell.descriptionLabel.text = projectsList[indexPath.row].description
        if(projectsList[indexPath.row].noOfLikes == 1){
            
            cell.followersLabel.text = String(projectsList[indexPath.row].noOfLikes) + " follower"
            
        }
        else{
            
            cell.followersLabel.text = String(projectsList[indexPath.row].noOfLikes) + " followers"
        
        }
        
        cell.descriptionLabel.numberOfLines = 0
        cell.descriptionLabel.lineBreakMode = .byWordWrapping
        
        let imageFromParse = projectsList[indexPath.row].image
        imageFromParse!.getDataInBackground(block: { (imageData: Data?, error: Error?) -> Void in
            
            if(imageData != nil){
                let image: UIImage! = UIImage(data: imageData!)!
                cell.projectImage.image = image
            }
        })
        
        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "project-view"){
            
            let destinationNavigationController = segue.destination as! UINavigationController
            let targetController = destinationNavigationController.topViewController as! ProjectViewController
            targetController.projectOject = projectsList[(projectTableView.indexPathForSelectedRow?.row)!]
            
        }
    }
    
    @IBAction func unwindToProjectsList(segue: UIStoryboardSegue) {
        // some code to execute
    } // unwindToPrevious
    

}
