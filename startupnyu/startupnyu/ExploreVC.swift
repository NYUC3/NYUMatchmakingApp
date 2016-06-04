//
//  ExploreVC.swift
//  startupnyu
//
//  Created by Vidyadhar V. Thatte on 1/24/16.
//  Copyright © 2016 Polymafia. All rights reserved.
//

import UIKit
import Parse

class ExploreVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var projects : Array<ExploreStruct> = []
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Explore Projects"
        
        if( PFUser.currentUser() == nil ){
            // display login
            let storyboard = UIStoryboard(name: "LoginSignupStoryboard", bundle: nil)
            let vc = storyboard.instantiateViewControllerWithIdentifier("login") as! LoginViewController
            self.presentViewController(vc, animated: true, completion: nil)
        }
        else{
            let query = PFQuery(className:"Project")
            query.findObjectsInBackgroundWithBlock {
                (objects: [PFObject]?, error: NSError?) -> Void in
                
                if error == nil {
                    // The find succeeded.
                    print("Successfully retrieved \(objects!.count) scores.")
                    // Do something with the found objects
                    if let objects = objects {
                        for object in objects {
                            
                            if let userPicture = object["Image"] as? PFFile {
                                userPicture.getDataInBackgroundWithBlock { (imageData: NSData?, error: NSError?) -> Void in
                                    if (error == nil) {
                                        let theStruct = ExploreStruct(name: object["Name"] as! String, tags: object["Tags"] as? String, img: UIImage(data:imageData!)!)
                                        self.projects.append(theStruct)
                                        self.tableView.reloadData()
                                    }
                                }
                            }
                        }
                    }
                }
                
                else {
                    // Log details of the failure
                    print("Error: \(error!) \(error!.userInfo)")
                }
            }
        }
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return projects.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! ProjectCell
        cell.projectName.text = projects[indexPath.row].name
        cell.projectDesc.text = projects[indexPath.row].tags
        cell.projectImage.image = projects[indexPath.row].image
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let vc = segue.destinationViewController as! ProjectTableViewController
        vc.projectName = projects[self.tableView.indexPathForSelectedRow!.row].name!
    }
    
}
