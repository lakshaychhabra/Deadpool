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
import Toast_Swift

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
            
            //displayAlert(title: "Empty Fields", message: "Please Fill All the Fields")
            self.view.makeToast("Please Enter All The Fields", duration: 1.0, position: .center)
        }
        else if password.text != confirmPassword.text {
            
                //displayAlert(title: "Password Doesnot Match", message: "Please use same password in both text fields")
            self.view.makeToast("Password Doesnot Match", duration: 1.0, position: .center)
        }
        else if phoneNumber.text?.count != 10 {
           // displayAlert(title: "Wrong Phone Number", message: "Doesnot match to Indian Custom")
            self.view.makeToast("Incorrect Phone Number", duration: 1.0, position: .center)
        }
        else if !switchTerms.isOn {
            
           // displayAlert(title: "Accept Terms And Condition", message: "Please Accept Terms and condtions")
            self.view.makeToast("Please Accept Terms and condtions", duration: 1.0, position: .center)
            
        }
        else if password.text != confirmPassword.text {
          //  displayAlert(title: "Password Doesnot Match", message: "Please use same password in both text fields")
            self.view.makeToast("Please use same password in both text fields", duration: 1.0, position: .center)
        }
            
        else{
            
            registerButton.isEnabled = true
            
            
            
            params = ["fullname" : name.text!, "email" : email.text!, "password" : password.text!, "dob" : dobLabel.text!, "phone" : phoneNumber.text!]
                
                activityIndicatorFunc()
                activityIndicator.startAnimating()
                UIApplication.shared.beginIgnoringInteractionEvents()
                
                Alamofire.request(Constants.signup, method: .post, parameters: params, encoding: URLEncoding.httpBody).responseJSON { (response) in
                    
                    
                    if let response = response.result.value {
                        print(response)
                        let data : JSON = JSON(response)
                        if data["success"] == true {
                           // self.performSegue(withIdentifier: "toMain", sender: nil)
                            print("Success")
                        }
                        else{
                            //let data : JSON = JSON(response)
                            
                            
                           // self.displayAlert(title: "Something Went Wrong", message: "One of the field you entered is incorrect.")
                             self.view.makeToast(data["err"][0].rawString(), duration: 1.0, position: .center)
                        }
                        
                    }
                    self.activityIndicator.stopAnimating()
                    UIApplication.shared.endIgnoringInteractionEvents()
            }
            
        }
        
    }
    @IBAction func dobButtonPressed(_ sender: Any) {
        
    }
    
    func activityIndicatorFunc() {
        
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicator)
    }
    
 
    
}









