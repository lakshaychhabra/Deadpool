//
//  MyAccount.swift
//  fanatic11
//
//  Created by Lakshay Chhabra on 22/08/18.
//  Copyright © 2018 App Groceries. All rights reserved.
//

import UIKit

class MyAccount: UIViewController {

   
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCellNib(named: "ProfilHeadTableViewCell", with: tableView)
        registerCellNib(named: "MenuCells", with: tableView)
    }

}

//Mark :- Table controls
extension MyAccount : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfilHeadTableViewCell") as! ProfilHeadTableViewCell
            return cell
        }
        else {
             let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCells") as! MenuCells
            if indexPath.row == 0 {
                cell.labelText.text = "My Account"
                return cell
            }
            else if indexPath.row == 1 {
                cell.labelText.text = "Profile Information"
                return cell
            }
            else {
                cell.labelText.text = "Refer Friend"
                return cell
            }
        }
      
    }
    
}
