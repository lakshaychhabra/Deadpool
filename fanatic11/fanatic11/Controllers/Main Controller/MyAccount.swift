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
    }

}

//Mark :- Table controls
extension MyAccount : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            cell?.textLabel?.text = "Lakshay"
            return cell!
        }
      
    }
    
}
