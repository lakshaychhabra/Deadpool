//
//  AppStartsViewController.swift
//  fanatic11
//
//  Created by Lakshay Chhabra on 23/08/18.
//  Copyright © 2018 App Groceries. All rights reserved.
//

import UIKit

class AppStartsViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
     let network: NetworkManager = NetworkManager.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()

   
            
            NetworkManager.isUnreachable { _ in
                self.showOfflinePage()
                
            }
        
            NetworkManager.isReachable { (_) in
                DispatchQueue.main.async {
                self.showLoginScreens()
                }
                
            

        }
        
    }
    
  
    
 
}

extension UIViewController{
    
    func showLoginScreens() -> Void {
        let storyBoard: UIStoryboard = UIStoryboard(name: "LoginScreens", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "login") as! LoginViewController
        
        self.present(newViewController, animated: true, completion: nil)
    }
 
    func showMainController() -> Void {
        DispatchQueue.main.async {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "home") as! Home
            let navController : UINavigationController = UINavigationController(rootViewController: newViewController)
            self.present(navController, animated: true, completion: nil)
            print("Showing Main Screen")
        }
    }
    
     func showOfflinePage() -> Void {
        DispatchQueue.main.async {
            let storyBoard: UIStoryboard = UIStoryboard(name: "AppStarts", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "NoWifi") as! NoInternetViewController
            
            self.present(newViewController, animated: true, completion: nil)
        }
    }
    
}
