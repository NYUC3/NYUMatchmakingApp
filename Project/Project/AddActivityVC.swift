//
//  AddActivityVC.swift
//  Project
//
//  Created by Vidyadhar V. Thatte on 9/21/16.
//  Copyright © 2016 Vidyadhar Thatte. All rights reserved.
//

import UIKit
import Parse

class AddActivityVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var theTableView: UITableView!

    var myFeedList = [Feed]()
    
    override func viewDidAppear(_ animated: Bool) {
        theTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var query = PFQuery(className:"MyActivities")
        query.whereKey("username", equalTo:"vdthatte@nyu.edu")
        query.findObjectsInBackground {
            (objects: [PFObject]?, error: Error?) -> Void in
            
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects
                if let objects = objects {
                    for object in objects {
                        
                        let feed = Feed(name: object["projectName"] as! String, title: object["activityName"] as! String, desc: object["activityDescription"] as! String, image: NSData())
                        self.myFeedList.append(feed)
                        
                    }
                }
                
               self.theTableView.reloadData()
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error! as! NSError)")
            }
        }
        
    }
    

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return myFeedList.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "myfeed-cell", for: indexPath) as! MyFeedCell
        
        cell.myProjectLabel.text = myFeedList[indexPath.row].name
        cell.myTitleLabel.text = myFeedList[indexPath.row].title
        cell.myActivityDiscription.text = myFeedList[indexPath.row].description
        return cell
    }




}
