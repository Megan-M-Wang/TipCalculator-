//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Megan on 12/31/16.
//  Copyright © 2016 Megan. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.endEditing(false)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    @IBAction func billEntered(_ sender: Any) {
        
        let bill = Double(billField.text!) ?? 0
        let defaults = UserDefaults.standard
        
        defaults.set(bill, forKey: "myBill")
        defaults.synchronize()
        
    }
}

