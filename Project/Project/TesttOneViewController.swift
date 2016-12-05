//
//  TesttOneViewController.swift
//  Project
//
//  Created by Vidyadhar V. Thatte on 12/4/16.
//  Copyright © 2016 Vidyadhar Thatte. All rights reserved.
//

import UIKit

class TesttOneViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var list = ["one", "two"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return list.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1234", for: indexPath) 
        return cell
        
    }

    
    
    
}
