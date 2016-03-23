//
//  messagesViewController.swift
//  startupnyu
//
//  Created by Vidyadhar V. Thatte on 1/16/16.
//  Copyright © 2016 Polymafia. All rights reserved.
//

import UIKit


class messagesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var messageDockConstraint: NSLayoutConstraint!
    @IBOutlet weak var messageTextBox: UITextField!
    @IBOutlet weak var dockView: UIView!
    @IBOutlet weak var sendButton: UIButton!
    
    var messages = Array<MessageStruct>()
    
    override func viewDidLoad() {
        // load messages from DB
        messages.append(MessageStruct(content: "Hi!"))
        messageTextBox.delegate = self
        self.messageDockConstraint.constant = 0.83*UIScreen.mainScreen().bounds.height
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return messages.count
    }
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("message", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = messages[indexPath.row].content
        return cell
    }

    @IBAction func sendButtonTapped(sender: UIButton) {
        
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        self.view.layoutIfNeeded()
        
        UIView.animateWithDuration(0.2, animations: {
            self.messageDockConstraint.constant = 0.45*UIScreen.mainScreen().bounds.height
            self.view.layoutIfNeeded()
            
            }, completion: nil)
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        self.view.layoutIfNeeded()
        UIView.animateWithDuration(0.2, animations: {
            self.messageDockConstraint.constant = 0.83*UIScreen.mainScreen().bounds.height
            self.view.layoutIfNeeded()
            
            }, completion: nil)
        
    }
    

    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
}
