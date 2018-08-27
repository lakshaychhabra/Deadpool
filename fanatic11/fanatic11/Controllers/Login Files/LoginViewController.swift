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
import Toast_Swift

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
        
        username.text = "l@gmail.com"
        password.text = "lll"
        
    }

    @IBAction func loginButtonPressed(_ sender: Any) {
        
        login()
        
        
        
    }
    
    func login(){
        
        if username.text == "" || password.text == "" {
            displayAlert(title: "Empty Fields", message: "Please fill all the fields")
        }
        else{
            params = ["id" : username.text!, "password" : password.text!]
            
            activityIndicatorFunc()
            activityIndicator.startAnimating()
            UIApplication.shared.beginIgnoringInteractionEvents()
            
            Alamofire.request(Constants.loginUrl, method: .post, parameters: params, encoding: URLEncoding.httpBody).responseJSON { (response) in
                
                
                if let response = response.result.value {
                    print(response)
                    let data : JSON = JSON(response)
                    if data["success"] == true {
                        self.activityIndicator.stopAnimating()
                        UIApplication.shared.endIgnoringInteractionEvents()
                        
                        self.performSegue(withIdentifier: "toMain", sender: nil)
                    }
                    else{
                        self.activityIndicator.stopAnimating()
                        UIApplication.shared.endIgnoringInteractionEvents()
                        
                        self.view.makeToast(data["msg"].rawString(), duration: 2.0, position: .center)
                        
                    }
                    
                }
               
            }
            
           
        }
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
    }
    
    func activityIndicatorFunc() {
      
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicator)
    }
}
