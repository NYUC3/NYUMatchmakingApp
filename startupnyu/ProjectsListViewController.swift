//
//  ProjectsListViewController.swift
//  startupnyu
//
//  Created by Vidyadhar V. Thatte on 4/7/16.
//  Copyright © 2016 Polymafia. All rights reserved.
//

import UIKit
import Parse

class ProjectsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    var projectsList : Array<ExploreStruct> = [] // Note: ExploreStruct is a shitty name pls change

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // TO DO: Load user's projects into projectsList
        
        
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return projectsList.count + 1
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        if(indexPath.row == projectsList.count){
            let cell = tableView.dequeueReusableCellWithIdentifier("addbutton", forIndexPath: indexPath) as! AddButtonTableViewCell
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCellWithIdentifier("createproject", forIndexPath: indexPath) as! MyProjectsTableViewCell
            return cell
        }

    }


}
