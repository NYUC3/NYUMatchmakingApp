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

        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Avenir", size: 30)!]
        
        if(PFUser.current() == nil){
            
            // present login screen
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "loginvc") as! LoginVC
            self.present(vc, animated: true, completion: nil)
            
        }
        else{
            
            
            overlay = UIView(frame: view.frame)
            overlay!.backgroundColor = UIColor.black
            overlay!.alpha = 0.8
            
            view.addSubview(overlay!)
            
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
                            
                                let project = Feed(name: object["Name"] as! String, title: "", desc: object["Description"] as! String, image: theImg)
                            
                                self.projectsList.append(project)
                        }
                    
                    }
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
    
    
    func addParallaxToView(vw: UIView) {
        let amount = 10
        
        //let horizontal = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        //horizontal.minimumRelativeValue = -amount
        //horizontal.maximumRelativeValue = amount
        
        let vertical = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        vertical.minimumRelativeValue = -amount
        vertical.maximumRelativeValue = amount
        
        let group = UIMotionEffectGroup()
        group.motionEffects = [vertical]
        vw.addMotionEffect(group)
    }
 

}
