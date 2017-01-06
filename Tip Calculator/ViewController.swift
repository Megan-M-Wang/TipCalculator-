//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Megan on 12/31/16.
//  Copyright © 2016 Megan. All rights reserved.
//

import UIKit
import Foundation

/* Class for the first screen of the application */
class ViewController: UIViewController {
    
    //Link to the bill entering text field
    @IBOutlet weak var billField: UITextField!
    
    /* Check loading and manually set first responder */
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()
    }

    /* Provided function -- call to super */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /* Handle tap function -- ends editing */
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    /* Updates the stored bill value when the entered
       value is changed */
    @IBAction func billEntered(_ sender: Any) {
        
        //Vars -- bill received from the text field and
        //default var storage
        let bill = Double(billField.text!) ?? 0
        let defaults = UserDefaults.standard
        
        //Map bill to the key myBill and synchronize
        defaults.set(bill, forKey: "myBill")
        defaults.synchronize()
        
    }
}

