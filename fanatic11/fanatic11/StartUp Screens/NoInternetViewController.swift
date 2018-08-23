//
//  NoInternetViewController.swift
//  fanatic11
//
//  Created by Lakshay Chhabra on 23/08/18.
//  Copyright © 2018 App Groceries. All rights reserved.
//

import UIKit

class NoInternetViewController: UIViewController {
    
let network = NetworkManager.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkManager.isReachable { (_) in
            self.showMainController()
        }
        network.reachability.whenReachable = { _ in
            print("trying to connect")
            self.showMainController()
        }
    
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the navigation bar
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    

    @IBAction func retryButtonPressed(_ sender: Any) {
        
        print("retry Button Pressed")
        network.reachability.whenReachable = { _ in
            print("Going Online")
            self.showMainController()
        }
        NetworkManager.isReachable { (_) in
            self.showMainController()
        }
    }


    
}
