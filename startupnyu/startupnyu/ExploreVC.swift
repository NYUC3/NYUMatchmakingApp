//
//  ExploreVC.swift
//  startupnyu
//
//  Created by Vidyadhar V. Thatte on 1/24/16.
//  Copyright © 2016 Polymafia. All rights reserved.
//

import UIKit
import Parse
import BTNavigationDropdownMenu


struct StudentStruct {
    var name : String
    var image : UIImage
    var oneLineBio : String
    init(name : String, image : UIImage, oneLineBio : String){
        self.name = name
        self.image = image
        self.oneLineBio = oneLineBio
    }
}




class ExploreVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let menu_items = ["Projects", "People"]
    
    var projects : Array<ExploreStruct> = []
    var students : Array<StudentStruct> = []
    var menuItemSelected : String?
    
    @IBOutlet weak var shareButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuItemSelected = menu_items[0]
        self.title = "Explore"
        let menuView = BTNavigationDropdownMenu(navigationController: self.navigationController, title:menu_items.first!, items:menu_items)
        self.navigationItem.titleView = menuView
        
        if let font = UIFont(name: "Avenir", size: 15) {
            shareButton.setTitleTextAttributes([NSFontAttributeName: font], forState: UIControlState.Normal)
        }

        
        menuView.didSelectItemAtIndexHandler = {[weak self] (indexPath: Int) -> () in
            self?.menuItemSelected = self?.menu_items[indexPath]
            print(self!.students)
            self?.tableView.reloadData()
        }
        
        if( PFUser.currentUser() == nil ){
            // display login
            print(PFUser.currentUser())
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
                
                
                let another_query = PFQuery(className:"Student")
                another_query.findObjectsInBackgroundWithBlock {
                    (objects: [PFObject]?, error: NSError?) -> Void in
                    
                    if error == nil {
                        // The find succeeded.
                        print("Successfully retrieved \(objects!.count) scores.")
                        // Do something with the found objects
                        if let objects = objects {
                            for object in objects {
                                
                                if let userPicture = object["ProfilePicture"] as? PFFile {
                                    userPicture.getDataInBackgroundWithBlock { (imageData: NSData?, error: NSError?) -> Void in
                                        if (error == nil) {
                                            let theStruct = StudentStruct(name: (object["FirstName"]  as! String) + (object["LastName"] as! String), image: UIImage(data:imageData!)!, oneLineBio: (object["OneLineDescription"] as? String)!)
                                            self.students.append(theStruct)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                
            }
            
        }
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        if(menuItemSelected == "Projects"){
            return projects.count
        }
        else{
            return students.count
        }
        
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        if(menuItemSelected == "Projects"){
            
            let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! ProjectCell
            cell.projectName.text = projects[indexPath.row].name
            cell.projectDesc.text = projects[indexPath.row].tags
            cell.projectImage.image = projects[indexPath.row].image
            return cell
        
        }
        else{
            
            let cell = tableView.dequeueReusableCellWithIdentifier("studentcell", forIndexPath: indexPath) as! StudentCellTableView
            cell.studentImageView.image = students[indexPath.row].image
            cell.studentName.text = students[indexPath.row].name
            cell.studentOneLineBio.text = students[indexPath.row].oneLineBio
            return cell
        
        }
    
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(menuItemSelected == "Projects"){
            let vc = segue.destinationViewController as! ProjectTableViewController
            vc.projectName = projects[self.tableView.indexPathForSelectedRow!.row].name!
        }
        else{
            let vc = segue.destinationViewController as! ProfileViewController
            vc.studentName = students[self.tableView.indexPathForSelectedRow!.row].name
        }

    }
    
}
