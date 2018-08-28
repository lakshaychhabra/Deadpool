//
//  MyContestViewController.swift
//  fanatic11
//
//  Created by Lakshay Chhabra on 23/08/18.
//  Copyright © 2018 App Groceries. All rights reserved.
//

import UIKit

class MyContestViewController: UIViewController {

    @IBOutlet var contestSegment: UISegmentedControl!
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        registerCellNib(named: "Matches", with: tableView)
    }

}

//Mark :- Table controls
extension MyContestViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Matches") as! Matches
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    

    
   
    
}
