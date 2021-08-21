//
//  ViewController.swift
//  AgeCalculator
//
//  Created by Alexander Rojas Benavides on 8/21/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ageLabel:UILabel!
    @IBOutlet weak var dobTextField: UITextField!
    
    var datePicker:UIDatePicker?
    var toolBar:UIToolbar = UIToolbar()
    var dateOfBirth: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.doDatePicker()
        // Do any additional setup after loading the view.
    }

    func doDatePicker() {
        self.datePicker = UIDatePicker(frame: CGRect(x:0, y:0, width: self.view.frame.size.width, height: 200))
        
        self.datePicker?.datePickerMode = UIDatePicker.Mode.date
        datePicker?.preferredDatePickerStyle = UIDatePickerStyle.wheels
        
        datePicker?.maximumDate = Date()
        
        dobTextField.inputView = datePicker
        
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 95/255, green: 216/255, blue: 1, alpha: 1)
        toolBar.sizeToFit()
        
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneClick))
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelClick))
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: true)
        
        toolBar.isUserInteractionEnabled = true
        
        dobTextField.inputAccessoryView = toolBar
    }
    
    @objc func doneClick() {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .medium
        
        dateOfBirth = datePicker?.date
        dobTextField.text = dateFormatter.string(from: dateOfBirth!)
        
        self.view.endEditing(true)
    }
    
    @objc func cancelClick() {
        self.view.endEditing(true)
    }
    
    @IBAction func calculateAgeBtnAxn(_ sender: Any) {
        if let dob = dateOfBirth {
            let today = Date()
            let calendar = Calendar.current
            
            let age =  calendar.dateComponents([.year, .month, .day], from: dob, to: today)
            let ageInYears = age.year ?? 0
            let ageInMonths = age.month ?? 0
            let ageInDays = age.day ?? 0
            
            
            ageLabel.text = "\(ageInYears)yr \(ageInMonths)m \(ageInDays)d"
        }
    }

}

