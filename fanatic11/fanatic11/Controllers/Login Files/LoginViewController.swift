//
//  LoginViewController.swift
//  fanatic11
//
//  Created by Lakshay Chhabra on 20/08/18.
//  Copyright © 2018 App Groceries. All rights reserved.
//

import UIKit
import DTTextField
import Alamofire
import SwiftyJSON

class LoginViewController: UIViewController {

    @IBOutlet var username: DTTextField!
    @IBOutlet var password: DTTextField!
    @IBOutlet var loginButton: UIButton!
    
    var params = [String : String]()
    let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        password.isSecureTextEntry = true
        loginButton.layer.cornerRadius = 10
        
    }

    @IBAction func loginButtonPressed(_ sender: Any) {
        
        login()
        
        
        
    }
    
    func login(){
        
        if username.text == "" || password.text == "" {
            displayAlert(title: "Empty Fields", message: "Please fill all the fields")
        }
        else{
            params = ["email" : username.text!, "password" : password.text!]
            
            
            activityIndicator.startAnimating()
            UIApplication.shared.beginIgnoringInteractionEvents()
            
            Alamofire.request(Constants.signup, method: .post, parameters: params, encoding: URLEncoding.httpBody).responseJSON { (response) in
                
                
                if let response = response.result.value {
                    let data : JSON = JSON(response)
                    if data["success"] == true {
                        self.performSegue(withIdentifier: "toMain", sender: nil)
                    }
                    else{
                        self.displayAlert(title: "Something Went Wrong", message: "One of the field you entered is incorrect.")
                    }
                    
                }
            }
            activityIndicator.stopAnimating()
        }
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
    }
}
