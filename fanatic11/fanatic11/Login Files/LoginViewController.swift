//
//  LoginViewController.swift
//  fanatic11
//
//  Created by Lakshay Chhabra on 20/08/18.
//  Copyright © 2018 App Groceries. All rights reserved.
//

import UIKit
import DTTextField

class LoginViewController: UIViewController {

    @IBOutlet var username: DTTextField!
    @IBOutlet var password: DTTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        password.isSecureTextEntry = true
        
        
    }

    @IBAction func loginButtonPressed(_ sender: Any) {
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
    }
}
