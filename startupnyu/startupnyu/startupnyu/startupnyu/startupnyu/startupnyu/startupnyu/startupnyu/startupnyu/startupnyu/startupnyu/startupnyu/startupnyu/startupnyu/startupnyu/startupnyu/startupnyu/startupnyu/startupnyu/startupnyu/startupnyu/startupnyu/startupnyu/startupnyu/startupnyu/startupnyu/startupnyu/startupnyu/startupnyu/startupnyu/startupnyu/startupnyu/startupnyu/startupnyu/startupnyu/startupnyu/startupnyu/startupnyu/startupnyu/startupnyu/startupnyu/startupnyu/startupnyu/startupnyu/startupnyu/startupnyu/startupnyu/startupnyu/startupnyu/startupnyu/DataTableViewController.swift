//
//  DataTableViewController.swift
//  startupnyu
//
//  Created by Jay Kumar on 1/16/16.
//  Copyright © 2016 Polymafia. All rights reserved.
//

import UIKit

class DataTableViewController: UITableViewController {

    // MARK: - UITableViewDataSource

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return 5
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("LabelCell", forIndexPath: indexPath) 

        cell.textLabel?.text = "Section \(indexPath.section) Row \(indexPath.row)"

        return cell
    }
}



/*  UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Back"
style:UIBarButtonSystemItemDone target:nil action:nil];
UINavigationItem *item = [[UINavigationItem alloc] initWithTitle:@"Title"];
item.leftBarButtonItem = rightButton;
item.hidesBackButton = YES;
[self.yourNavigationBar pushNavigationItem:item animated:NO];*/

/* UIViewController *toViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"OtherViewControllerId"];
MyCustomSegue *segue = [[MyCustomSegue alloc] initWithIdentifier:@"Back" source:self destination:toViewController];
[self prepareForSegue:segue sender:sender];
[segue perform];

class BackButton: UIViewController{
UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back"
style:UIBarButtonItemStyleDone
target:self
action:@selector(backButtonTap:)];
self.navigationItem.rightBarButtonItems = @[backButton];

(void)buttonizeButtonTap:(id)sender{
[self performSegueWithIdentifier:@"Associate" sender:sender];
}

(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
if ([[segue identifier] isEqualToString:@"Associate"])
{
TranslationQuizAssociateVC *translationQuizAssociateVC = [segue destinationViewController];
translationQuizAssociateVC.nodeID = self.nodeID; //--pass nodeID from ViewNodeViewController
translationQuizAssociateVC.contentID = self.contentID;
translationQuizAssociateVC.index = self.index;
translationQuizAssociateVC.content = self.content;
}
} */
