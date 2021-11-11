//
//  NextViewController.swift
//  d02
//
//  Created by Константин Мишин on 23.09.2021.
//

import UIKit

class NextViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var NameField: UITextField!
    
    @IBOutlet weak var DescriptionField: UITextView!
    
    @IBOutlet weak var DateField: UIDatePicker!
    
    @IBAction func Done(_ sender: Any) {
        performSegue(withIdentifier: "add", sender: "Done")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "add"
        {
            let format = DateFormatter()
            format.dateFormat = "dd MMMM yyyy HH:mm:ss"
            print(NameField.text!)
            print(DescriptionField.text!)
            print(format.string(from: DateField.date))
            if (NameField.text != "")
            {
                Data.names.append((NameField.text!, DescriptionField.text!, format.string(from: DateField.date)))
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DateField.minimumDate = Date()
        NameField.placeholder = "Name"
        DescriptionField.layer.borderWidth = 1
        DescriptionField.layer.borderColor = UIColor.black.cgColor
    }
}

