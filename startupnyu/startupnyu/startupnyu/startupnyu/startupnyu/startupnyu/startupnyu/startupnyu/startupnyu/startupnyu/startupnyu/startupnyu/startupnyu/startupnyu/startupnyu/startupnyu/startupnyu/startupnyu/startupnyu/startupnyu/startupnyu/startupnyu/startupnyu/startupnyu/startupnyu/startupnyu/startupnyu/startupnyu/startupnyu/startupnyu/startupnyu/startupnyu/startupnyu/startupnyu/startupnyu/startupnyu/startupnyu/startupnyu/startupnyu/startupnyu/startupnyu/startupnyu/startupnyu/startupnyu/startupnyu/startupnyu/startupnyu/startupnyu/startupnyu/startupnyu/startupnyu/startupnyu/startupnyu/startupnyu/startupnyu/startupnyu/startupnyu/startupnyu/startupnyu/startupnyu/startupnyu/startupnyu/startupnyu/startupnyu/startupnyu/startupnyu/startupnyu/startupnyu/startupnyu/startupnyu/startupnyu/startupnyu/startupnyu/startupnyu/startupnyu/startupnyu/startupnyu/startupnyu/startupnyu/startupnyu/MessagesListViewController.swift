//
//  MessagesListViewController.swift
//  startupnyu
//
//  Created by Vidyadhar V. Thatte on 1/16/16.
//  Copyright © 2016 Polymafia. All rights reserved.
//

import UIKit
import Parse

class MessagesListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var messagesList = Array<messageList>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        messagesList.append(messageList(name: "Vd", image: "img.png"))
        messagesList.append(messageList(name:"Jay", image:"img.png"))

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return messagesList.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("list", forIndexPath: indexPath) as!  MessageListViewCell
        cell.nameLabel.text = messagesList[indexPath.row].name
        cell.senderProfileImage.layer.cornerRadius = cell.senderProfileImage.frame.size.width / 2;
        cell.senderProfileImage.clipsToBounds = true;
        cell.nameLabel.textAlignment = .Left
        return cell
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
