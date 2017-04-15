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
    var project : Project?

    @IBOutlet weak var daTableView: UITableView! // This is a bad name
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadingView.isHidden = false
        self.infoLabel.text = "Loading..."
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
                            var feed = Feed(name: name, title: title, desc: description, image: object["image"] as! PFFile, likes: 0)
                                
                            feed.timestamp = String(describing: self.processTimestamp(str: String(describing: object.createdAt!)))

                            // idk how to pass by reference in swift so I'm gonna add the next function here (I know this is really crappy code fyi)
 
                            // create a new query to get the number of likes
                            let q = PFQuery(className:"likes")
                            q.whereKey("title", equalTo: title)
                            q.findObjectsInBackground {
                                (objects: [PFObject]?, error: Error?) -> Void in
                                    
                                if error == nil {
                                    // The find succeeded.
                                    if let objects = objects {
                                            
                                        feed = Feed(name: name, title: title, desc: description, image: object["image"] as! PFFile, likes: objects.count)
                                        for obj in objects{
                                            if(obj["username"] as! String == PFUser.current()?.username){
                                                    feed.isLiked = true
                                            }
                                        }
                                        self.feedList.append(feed)
                                        self.loadingView.isHidden = true
                                        self.daTableView.reloadData()
                                        
                                        if(self.feedList.count == 0){
                                            self.loadingView.isHidden = false
                                            self.infoLabel.text = "No activity to show."
                                        }
                                        else{
                                            self.loadingView.isHidden = true
                                        }
                                        
                                    }
                                }
                                else {
                                        // Log details of the failure
                                        print("Error: \(error!)")
                                }
                            }
                        }
                    }
                }
            }
            else {
                print("Error: \(error!)")
            }
        }
    }
    
  
    func processTimestamp(str : String)->String{
        var processed = ""
        var components = str.characters.split{$0 == " "}.map(String.init)
        var dateArr = components[0].characters.split{$0 == "-"}.map(String.init)
        processed = dateArr[1] + "/" + dateArr[2] + "/" + dateArr[0]
        print(processed)
        return processed
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        feedList = []
        projectsFollowing = []
        
        let user = PFUser.current()?.username
        let query = PFQuery(className: "Follow")
        query.whereKey("username", equalTo: user!)
        query.order(byDescending: "createdAt")
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
                    if(!self.projectsFollowing.isEmpty){
                        self.daTableView.reloadData()
                        self.daTableView.isHidden = false
                    }
                    else{
                        self.daTableView.isHidden = true
                    }
                }
            }
            else {
                // Log details of the failure
                print("Error: \(error!)")
            }
        }
    }
    
    
    // Tableview data source methods
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return feedList.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "feed-cell", for: indexPath) as! FeedVCTableViewCell
       // cell.projectNameLabel.text = feedList[indexPath.row].name
        cell.feedTitleLabel.text  = feedList[indexPath.row].title
        
        
        let myString = " " + feedList[indexPath.row].name! + " "
        let myAttribute = [NSBackgroundColorAttributeName: UIColor.black, NSForegroundColorAttributeName: UIColor.white]
        let myAttrString = NSAttributedString(string: myString, attributes: myAttribute)
        cell.projectNameLabel.attributedText =  myAttrString
        
        
        //cell.feedDescriptionLabel.text = feedList[indexPath.row].description
        //cell.noOfLikes.text = String(feedList[indexPath.row].noOfLikes) + " likes"
        //cell.timeStampLabel.text = feedList[indexPath.row].timestamp
        //if(feedList[indexPath.row].isLiked){
        //    print("isLiked")
        //    let filledImage = UIImage(named: "filled-shape")
        //    cell.likeButton.setImage(filledImage, for: .normal)
        //}
        //else{
        //    let filledImage = UIImage(named: "Shape")
        //    cell.likeButton.setImage(filledImage, for: .normal)
        //}
        //cell.likeButton.tag = indexPath.row
        //cell.likeButton.addTarget(self, action: #selector(FeedVC.buttonClicked(sender:)), for: UIControlEvents.touchUpInside)
        //cell.feedDescriptionLabel.lineBreakMode = .byWordWrapping
        //cell.feedDescriptionLabel.numberOfLines = 0
        let imageFromParse = feedList[indexPath.row].image
        imageFromParse!.getDataInBackground(block: { (imageData: Data?, error: Error?) -> Void in
            let image: UIImage! = UIImage(data: imageData!)!
            cell.feedImage.image = image
        })
        return cell
        
    }
    
    func buttonClicked(sender:UIButton) {
        let buttonRow = sender.tag
        
        if(feedList[buttonRow].isLiked){
            // delete a like from the likes class
            
            let query = PFQuery(className:"likes")
            query.whereKey("title", equalTo: feedList[buttonRow].title!)
            //query.whereKey("project", equalTo: projectOject?.name)
            query.findObjectsInBackground {
                (objects: [PFObject]?, error: Error?) -> Void in
                
                if error == nil {
                    // The find succeeded.
                    if let objects = objects {
                        for object in objects {
                            if(object["projectname"] as? String == self.feedList[buttonRow].name){
                                if(object["username"] as? String == PFUser.current()?.username){
                                    object.deleteInBackground()
                                    
                                    // query to activity in activity class and decrement the number of likes
                                    
                                    let query = PFQuery(className:"MyActivities")
                                    query.whereKey("activityName", equalTo: self.feedList[buttonRow].title!)
                                    query.findObjectsInBackground {
                                        (objects: [PFObject]?, error: Error?) -> Void in
                                        
                                        if error == nil {
                                            // The find succeeded.
                                            if let objects = objects {
                                                for object in objects {
                                                    //if(object["projectName"] as? String == self.feedList[buttonRow].name){
                                                        //if(object["username"] as? String == PFUser.current()?.username){
                                                            
                                                            // query to activity in activity class and decrement the number of likes
                                                            let likes = object["likes"] as! Int
                                                            print("LIKES: \(likes)")
                                                            object["likes"] = likes - 1
                                                            object.saveInBackground()
                                                            
                                                        //}
                                                    //}
                                                }
                                            }
                                        } else {
                                            // Log details of the failure
                                            print("Error: \(error!)")
                                        }
                                        
                                    }
                   
                                }
                            }
                        }
                    }
                } else {
                    // Log details of the failure
                    print("Error: \(error!)")
                }
            }

            let filledImage = UIImage(named: "Shape")
            sender.setImage(filledImage, for: .normal)
            feedList[buttonRow].isActive = false
            feedList[buttonRow].noOfLikes -= 1
            
            
        }
        else{
            // add a like to the likes class
            
            let likesClass = PFObject(className:"likes")
            likesClass["username"] = PFUser.current()?.username
            likesClass["projectname"] = feedList[buttonRow].name
            likesClass["title"] =  feedList[buttonRow].title
            
            likesClass.saveInBackground {
                (success: Bool, error: Error?) -> Void in
                if (success) {
                    // The object has been saved.
                    
                    print("save successful")
                    // query to activity in activity class and increment the number of likes
                    let query = PFQuery(className:"MyActivities")
                    query.whereKey("activityName", equalTo: self.feedList[buttonRow].title!)
                    query.findObjectsInBackground {
                        (objects: [PFObject]?, error: Error?) -> Void in
                        
                        if error == nil {
                            // The find succeeded.
                            if let objects = objects {
                                for object in objects {
                                    //if(object["projectName"] as? String == self.feedList[buttonRow].name){
                                        //if(object["username"] as? String == PFUser.current()?.username){
                                            
                                            // query to activity in activity class and decrement the number of likes
                                            print(object["likes"])
                                            object.incrementKey("likes")
                                            object.saveInBackground()
                                            
                                        //}
                                    //}
                                }
                            }
                        } else {
                            // Log details of the failure
                            print("Error: \(error!)")
                        }

                    }
                    
                } else {
                    // There was a problem, check error.description
                }
            }

            let filledImage = UIImage(named: "filled-shape")
            sender.setImage(filledImage, for: .normal)
            feedList[buttonRow].isActive = true
            feedList[buttonRow].noOfLikes += 1
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "view-activity"){
            let destinationNavigationController = segue.destination as! UINavigationController
            let targetController = destinationNavigationController.topViewController as! SingleActivityVC
            targetController.activityObject = feedList[(daTableView.indexPathForSelectedRow?.row)!]
        }
    }

    @IBAction func backTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }

}
