//
//  Matches.swift
//  fanatic11
//
//  Created by Lakshay Chhabra on 24/08/18.
//  Copyright © 2018 App Groceries. All rights reserved.
//

import UIKit

class Matches: UITableViewCell {

    @IBOutlet var mainView: UIView!
    @IBOutlet var matchType: UILabel!
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var logo1: UIImageView!
    @IBOutlet var logo2: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      
        mainView.layer.cornerRadius = 30
    }
   

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
