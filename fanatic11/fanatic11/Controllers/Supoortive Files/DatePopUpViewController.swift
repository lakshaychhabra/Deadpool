//
//  DatePopUpViewController.swift
//  GemSelection
//
//  Created by Lakshay Chhabra on 09/07/18.
//  Copyright © 2018 atlas. All rights reserved.
//

import UIKit

class DatePopUpViewController: UIViewController {

    @IBOutlet var saveButton: UIButton!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var selectDate: UILabel!
    var showTimePicker : Bool = false
    
   
    
    var date : String {
          let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/YYYY"
            return formatter.string(from: datePicker.date)
    }
    
    var formattedTime : String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateFormat = "HH:mm"
    
        return formatter.string(from: datePicker.date)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if showTimePicker {
            selectDate.text = "Select Time"
            datePicker.datePickerMode = .time
            saveButton.setTitle("Save Time", for: .normal)
        }
        else {
            selectDate.text = "Select date"
            datePicker.datePickerMode = .date
            saveButton.setTitle("Save Date", for: .normal)
        }
        
        
    }

  
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        if showTimePicker == false {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "saveDate"), object: self)
        }
        else {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "saveTime"), object: self)
        }
        dismiss(animated: true)
    }
    

    

}
