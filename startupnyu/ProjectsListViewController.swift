//
//  ProjectsListViewController.swift
//  startupnyu
//
//  Created by Vidyadhar V. Thatte on 4/7/16.
//  Copyright © 2016 Polymafia. All rights reserved.
//

import UIKit

class ProjectsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var projectsList = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
