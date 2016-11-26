//
//  FeedVC.swift
//  Project
//
//  Created by Vidyadhar V. Thatte on 9/21/16.
//  Copyright © 2016 Vidyadhar Thatte. All rights reserved.
//

import UIKit
import Parse

class FeedVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var feedList = [Feed]()
    var projectsFollowing = [String]()
    
    @IBOutlet weak var daTableView: UITableView! // This is a bad name
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user = PFUser.current()?.username
        print("USER")
        print(user)
        let query = PFQuery(className:"Follow")
        //query.whereKey("username", equalTo: user!)
        query.findObjectsInBackground {
            (objects: [PFObject]?, error: Error?) -> Void in
            
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects
                if let objects = objects {
                    for object in objects {
                        print(object["project"])
                        self.projectsFollowing.append(object["project"] as! String)
                        self.queryActivities(name: object["project"] as! String)
                        
                        
                    }
                    
                }
            } else {
                // Log details of the failure
                print("Error: \(error!)")
            }
        }
        
        
        
        
    }
    
    
    
    func queryActivities( name : String ){
        
        let qry = PFQuery(className:"MyActivities")

            qry.whereKey("projectName", equalTo: name)
            qry.findObjectsInBackground {
                (objects: [PFObject]?, error: Error?) -> Void in
                
                if error == nil {
                    // The find succeeded.
                    print("Successfully \(objects!.count) scores.")
                    // Do something with the found objects
                    if let objects = objects {
                        for object in objects {
                            print(object["image"])
                            
                            var name = ""
                            var title = ""
                            var description = ""
                            
                            if(object["projectName"] != nil){
                                name = object["projectName"] as! String
                            }
                            if(object["activityName"] != nil){
                                title = object["activityName"] as! String
                            }
                            if(object["activityDescription"] != nil){
                                description = object["activityDescription"] as! String
                            }
                            if(object["image"] != nil){
                                let feed = Feed(name: name, title: title, desc: description, image: object["image"] as! PFFile)
                                
                                self.feedList.append(feed)
                            }
                            
                        }
                        self.daTableView.reloadData()
                    }
                    
                    
                } else {
                    // Log details of the failure
                    print("Error: \(error!)")
                }
            }

    }
    
    
    @IBAction func refreshAction(_ sender: UIBarButtonItem) {
        self.daTableView.reloadData()
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        self.daTableView.reloadData()

        
    }
    
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return feedList.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "feed-cell", for: indexPath) as! FeedVCTableViewCell
        cell.projectNameLabel.text = feedList[indexPath.row].name
        cell.feedTitleLabel.text  = feedList[indexPath.row].title
        cell.feedDescriptionLabel.text = feedList[indexPath.row].description
        
        
        cell.feedDescriptionLabel.lineBreakMode = .byWordWrapping
        cell.feedDescriptionLabel.numberOfLines = 0
        
        let imageFromParse = feedList[indexPath.row].image
        imageFromParse!.getDataInBackground(block: { (imageData: Data?, error: Error?) -> Void in
            let image: UIImage! = UIImage(data: imageData!)!
            cell.feedImage.image = image
        })
        
        return cell
    }
    


}
