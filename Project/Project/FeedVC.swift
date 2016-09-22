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

    let feedList = [Feed]()
    
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
                        
                        let feed = Feed(name: object["projectName"] as! String, title: object["activityName"] as! String, desc: object["activityDescription"] as! String, image: object["image"] as! PFFile)
                        self.feedList.append(feed)
                        
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
        return feedList.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "feed-cell", for: indexPath)
        
        return cell
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
