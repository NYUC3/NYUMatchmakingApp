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
    
    @IBOutlet weak var projectTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if(PFUser.current() == nil){
            
            // present login screen
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "loginvc") as! LoginVC
            self.present(vc, animated: true, completion: nil)
            
        }
        else{
            
             let query = PFQuery(className:"Projects")
             // query.whereKey("username", equalTo:"vdthatte@nyu.edu")
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
                            let project = Feed(name: "one", title: "one", desc: "one", image: theImg)
                            self.projectsList.append(project)
                        }
                    
                    }
                }
                
                self.projectTableView.reloadData()
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

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return projectsList.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "home-cell", for: indexPath) as! HomeVCTableViewCell
        cell.projectName.text = projectsList[indexPath.row].name
        cell.descriptionLabel.text = projectsList[indexPath.row].description
        
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
            //targetController.projectOject = projectsList[pro]]
            
        }
    }
 

}