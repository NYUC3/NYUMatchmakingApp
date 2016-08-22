//
//  ExploreVC.swift
//  startupnyu
//
//  Created by Vidyadhar V. Thatte on 1/24/16.
//  Copyright © 2016 Polymafia. All rights reserved.
//

import UIKit
import BTNavigationDropdownMenu
import AWSCore


class ExploreVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK:- Outlets and Variables
    
    @IBOutlet weak var shareButton: UIBarButtonItem!                // share button
    @IBOutlet weak var tableView: UITableView!                      // table view
    
    let menu_items = ["Projects", "People"]                         // options for the dropdown in an array
    
    var projects : Array<ExploreStruct> = []                        // array to store project profiles
    var students : Array<StudentStruct> = []                        // array to store student profiles
    
    var menuItemSelected : String?                                  // variable stores selected option from dropDown
    
    
    // MARK:- ViewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        

        
        
        
        
        
        let signedIn = false // dummy value
        
        
         // setup dropdown menu
        if(signedIn){
            
            
        
        }
        else{
            
            //presentSignInViewController()
        
        }

        
    
        menuItemSelected = menu_items[0]                            // set default dropdown selection to option at index 0
        let menuView = BTNavigationDropdownMenu(navigationController: self.navigationController, title:menu_items.first!, items:menu_items)
        self.navigationItem.titleView = menuView
        
        menuView.didSelectItemAtIndexHandler = {[weak self] (indexPath: Int) -> () in
            
            self?.menuItemSelected = self?.menu_items[indexPath]
            print(self!.students)
            self?.tableView.reloadData()
            
        }//menuView
        
        // UI Customization
        self.title = "Explore"
        if let font = UIFont(name: "Avenir", size: 15) {
            
            shareButton.setTitleTextAttributes([NSFontAttributeName: font], forState: UIControlState.Normal)
            
        }//if
        
        
        


        
    } //viewDidLoad()
    
    func presentSignInViewController() {

    }
    
    
    // MARK:- Table View Methods

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        // returns the number based on the option selected in the dropdown menu
        
        if(menuItemSelected == "Projects"){
            return projects.count
        }//if
        else{
            return students.count
        }//else
        
    } //tableview( numberofRowsInSection )

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        if(menuItemSelected == "Projects"){

            let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! ProjectCell
            cell.projectName.text = projects[indexPath.row].name
            cell.projectDesc.text = projects[indexPath.row].tags
            cell.projectImage.image = projects[indexPath.row].image
            return cell
        
        }//if
        
        else{
        
            let cell = tableView.dequeueReusableCellWithIdentifier("studentcell", forIndexPath: indexPath) as! StudentCellTableView
            cell.studentImageView.image = students[indexPath.row].image
            cell.studentName.text = students[indexPath.row].name
            cell.studentOneLineBio.text = students[indexPath.row].oneLineBio
            return cell
        
        }//else
    
    }//tableview ( cellforrowatindexpath )
    
    // MARK:- Segue Methods
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {   // segue to the next screen based on the student/project profile selected
        
        if(menuItemSelected == "Projects"){
        
            let vc = segue.destinationViewController as! ProjectTableViewController
            vc.projectName = projects[self.tableView.indexPathForSelectedRow!.row].name!
        
        }//of
        
        else{
        
            let vc = segue.destinationViewController as! ProfileViewController
            vc.studentName = students[self.tableView.indexPathForSelectedRow!.row].name
        
        }//else
    
    }//prepareForSegue
    
}
