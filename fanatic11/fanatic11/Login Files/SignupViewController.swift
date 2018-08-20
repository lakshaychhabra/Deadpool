//
//  SignupViewController.swift
//  fanatic11
//
//  Created by Lakshay Chhabra on 20/08/18.
//  Copyright © 2018 App Groceries. All rights reserved.
//

import UIKit
import DTTextField

class SignupViewController: UIViewController {

    @IBOutlet var name: DTTextField!
    @IBOutlet var phoneNumber: DTTextField!
    @IBOutlet var dob: DTTextField!
    @IBOutlet var email: DTTextField!
    @IBOutlet var password: DTTextField!
    @IBOutlet var confirmPassword: DTTextField!
    @IBOutlet var otp: DTTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        password.isSecureTextEntry = true
        confirmPassword.isSecureTextEntry = true

    }
    @IBAction func registerButtonPressed(_ sender: Any) {
    }
    
    @IBAction func sendOtpPressed(_ sender: Any) {
    }
}
