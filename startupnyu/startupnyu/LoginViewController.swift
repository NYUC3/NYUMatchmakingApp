//
//  LoginViewController.swift
//  startupnyu
//
//  Created by Vidyadhar V. Thatte on 1/25/16.
//  Copyright © 2016 Polymafia. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var username: UITextField!           // username
    @IBOutlet weak var password: UITextField!           // password
    @IBOutlet weak var loginButtonOutlet: UIButton!     // loginButton
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UI Customization
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background-login.png")!)
        
        loginButtonOutlet.layer.cornerRadius = 25
        loginButtonOutlet.layer.opacity = 0.7
        
        
    } //viewDidLoad()

    
    @IBAction func LoginButton(sender: UIButton) {
        
        
        
        
        
    } //LoginButton()
    
    @IBAction func unwindTologinup(segue: UIStoryboardSegue) {
        // some code to execute
    } // unwindTologinup


} // LoginViewController
