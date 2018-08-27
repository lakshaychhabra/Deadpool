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
    
    func registerCellNib(named name: String, with tableView: UITableView)
    {
        let cellNib = UINib(nibName: name, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: name)
    }
    func displayAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showLoginScreens() -> Void {
        let storyBoard: UIStoryboard = UIStoryboard(name: "LoginScreens", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "login") as! LoginViewController
        
        self.present(newViewController, animated: true, completion: nil)
    }
 
    func showMainController() -> Void {
        DispatchQueue.main.async {

            
            self.performSegue(withIdentifier: "toMain", sender: nil)
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
