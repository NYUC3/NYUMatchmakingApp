//
//  ProjectsListViewController.swift
//  startupnyu
//
//  Created by Vidyadhar V. Thatte on 4/7/16.
//  Copyright © 2016 Polymafia. All rights reserved.
//

import UIKit

class ProjectsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!                          // table view
    
    var projectsList : Array<MyProjectStruct> = []                      // array to store all the projects
    
    
    override func viewDidAppear(animated: Bool) {
    
        tableView.reloadData()
        self.title = "My Projects"
    
    } // viewDidAppear(_)

    
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
    
    } // viewDidLoad()

    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    
        return projectsList.count + 1                                   // + 1 is the extra cell for the plus/add button
    
    } // tableView(numberOfRows)
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        if(indexPath.row == projectsList.count){
            
            let cell = tableView.dequeueReusableCellWithIdentifier("addbutton", forIndexPath: indexPath) as! AddButtonTableViewCell
            return cell
            
        } //if
    
        else{
            
            let cell = tableView.dequeueReusableCellWithIdentifier("createproject", forIndexPath: indexPath) as! MyProjectsTableViewCell
            // WORK ON DISPLAYING PICTURE
            cell.projectName.text = projectsList[indexPath.row].name
            cell.projectImage.image = projectsList[indexPath.row].image
            return cell
            
        } //else
        
    } // tableView(cellForRowAtIndexPath)
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(tableView.indexPathForSelectedRow == projectsList.count + 1){
            
        } // if
            
        else{
            
            let vc = segue.destinationViewController as! MyProjectTableViewController
            vc.projectName = projectsList[self.tableView.indexPathForSelectedRow!.row].name
        
        } // else
        
    } // prepareForSegue(_)


    
    @IBAction func LogoutTapped(sender: AnyObject) {
        
        //PFUser.logOut()
        let storyboard = UIStoryboard(name: "LoginSignupStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("login") as! LoginViewController
        self.presentViewController(vc, animated: true, completion: nil)
        
    } // LogoutTapped(_)
    
    
    
} // ProjectsListViewController
