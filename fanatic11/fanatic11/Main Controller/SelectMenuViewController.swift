//
//  SelectMenuViewController.swift
//  fanatic11
//
//  Created by Lakshay Chhabra on 23/08/18.
//  Copyright © 2018 App Groceries. All rights reserved.
//

import UIKit

class SelectMenuViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCellNib(named: "MenuCells", with: tableView)
        
    }
    func displayAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "logout"{
            navigationController?.setNavigationBarHidden(true, animated: true)
            tabBarController?.tabBar.isHidden = true
        }
    }

    
}
//Mark :- Table controls
extension SelectMenuViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCells") as! MenuCells
        if indexPath.row == 0 {
            cell.labelText.text = "Help Desk"
            return cell
        }
        else if indexPath.row == 1 {
            cell.labelText.text = "Terms and Conditions"
            return cell
        }
        else if indexPath.row == 2 {
            cell.labelText.text = "Contact Us"
            return cell
        }
        else if indexPath.row == 3 {
            cell.labelText.text = "Point System"
            return cell
        }
        else if indexPath.row == 4 {
            cell.labelText.text = "Invite Friends"
            return cell
        }
        else if indexPath.row == 5 {
            cell.labelText.text = "About Us"
            return cell
        }
        else{
            cell.labelText.text = "Logout"
            return cell
        }
        
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 6 {
            performSegue(withIdentifier: "logout", sender: nil)
        }
        else{
            displayAlert(title: "Coming Soon", message: "Hold Tight")
        }
    }
    
}
