//
//  SignupViewController.swift
//  fanatic11
//
//  Created by Lakshay Chhabra on 20/08/18.
//  Copyright © 2018 App Groceries. All rights reserved.
//

import UIKit
import DTTextField
import Alamofire
import SwiftyJSON

class SignupViewController: UIViewController {

    @IBOutlet var registerButton: UIButton!
    @IBOutlet var name: DTTextField!
    @IBOutlet var phoneNumber: DTTextField!
    

    @IBOutlet var switchTerms: UISwitch!
    @IBOutlet var dobButton: UIButton!
    @IBOutlet var dobLabel: UILabel!
    @IBOutlet var email: DTTextField!
    @IBOutlet var password: DTTextField!
    @IBOutlet var confirmPassword: DTTextField!
   
    var params = [String : String]()
      let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        password.isSecureTextEntry = true
        confirmPassword.isSecureTextEntry = true
        registerButton.layer.cornerRadius = 10
        dobLabel.layer.borderWidth = 0.5
        dobLabel.layer.borderColor = UIColor.gray.cgColor
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        NotificationCenter.default.addObserver(self, selector: #selector(handlePopUpDate), name: NSNotification.Name(rawValue: "saveDate"), object: nil)
    }
    
    @objc func handlePopUpDate(notification : Notification){
        let dateVC = notification.object as! DatePopUpViewController
        dobLabel.text = dateVC.date
        dobButton.setTitle("", for: .normal)
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        register()
    }
    

    
    func register(){
        
        if name.text == "" || phoneNumber.text == "" || email.text == "" || password.text == "" || confirmPassword.text == "" || dobLabel.text == "" {
            
            displayAlert(title: "Empty Fields", message: "Please Fill All the Fields")
            
        }
        else if password.text != confirmPassword.text {
            
                displayAlert(title: "Password Doesnot Match", message: "Please use same password in both text fields")
            
        }
        else if phoneNumber.text?.count != 10 {
            displayAlert(title: "Wrong Phone Number", message: "Doesnot match to Indian Custom")
        }
        else if !switchTerms.isOn {
            
            displayAlert(title: "Accept Terms And Condition", message: "Please Accept Terms and condtions")
            
        }
            
        else{
            
            registerButton.isEnabled = true
            
            if password.text != confirmPassword.text {
                displayAlert(title: "Password Doesnot Match", message: "Please use same password in both text fields")
            }
        
            
            
        }
        
    }
    @IBAction func dobButtonPressed(_ sender: Any) {
        
    }
    
 
    
}









