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
    @IBOutlet weak var loadingView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.loadingView.isHidden = false
        let logo = UIImage(named: "main-logo")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {

        if(PFUser.current() == nil){
            
            // present login screen
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "landingvc") as! LandingPageViewController
            self.present(vc, animated: true, completion: nil)
            
        }
        else{
            
            self.projectsList = []
            
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
                        
                        self.loadingView.isHidden = true
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
        
        
        let myString = " " + projectsList[indexPath.row].name! + " " 
        let myAttribute = [NSBackgroundColorAttributeName: UIColor.black, NSForegroundColorAttributeName: UIColor.white]
        let myAttrString = NSAttributedString(string: myString, attributes: myAttribute)
        
        cell.projectName.attributedText =  myAttrString

        
        let imageFromParse = projectsList[indexPath.row].image
        imageFromParse!.getDataInBackground(block: { (imageData: Data?, error: Error?) -> Void in
            
            if(imageData != nil){
                let image: UIImage! = UIImage(data: imageData!)!
                cell.projectImage.image = cropToBounds(image: image, width: 375.0, height: 222.0)
            }
        })
        
        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "project-view"){
            
            let targetController = segue.destination as! ProjectViewController
            //let targetController = destinationNavigationController.topViewController as! ProjectViewController
            targetController.projectObject = projectsList[(projectTableView.indexPathForSelectedRow?.row)!]
            
        }
    }
    
    @IBAction func unwindToProjectsList(segue: UIStoryboardSegue) {
        // some code to execute
    } // unwindToPrevious

}


func cropToBounds(image: UIImage, width: Double, height: Double) -> UIImage {
    
    let contextImage : UIImage = UIImage(cgImage: image.cgImage!)
    //let contextImage: UIImage = UIImage(CGImage: image.CGImage!)!
    
    let contextSize: CGSize = contextImage.size
    
    var posX: CGFloat = 0.0
    var posY: CGFloat = 0.0
    var cgwidth: CGFloat = CGFloat(width)
    var cgheight: CGFloat = CGFloat(height)
    
    // See what size is longer and create the center off of that
    if contextSize.width > contextSize.height {
        posX = ((contextSize.width - contextSize.height) / 2)
        posY = 0
        cgwidth = contextSize.height
        cgheight = contextSize.height
    } else {
        posX = 0
        posY = ((contextSize.height - contextSize.width) / 2)
        cgwidth = contextSize.width
        cgheight = contextSize.width
    }
    
    let rect : CGRect = CGRect(x: posX, y: posY, width: cgwidth, height: cgheight)
    //let rect: CGRect = CGRectMake(posX, posY, cgwidth, cgheight)
    
    // Create bitmap image from context using the rect
    let imageRef: CGImage = contextImage.cgImage!.cropping(to: rect)!
    
    // Create a new image based on the imageRef and rotate back to the original orientation
    
    let image : UIImage = UIImage(cgImage: imageRef, scale: image.scale, orientation: image.imageOrientation)
    
    return image
}
