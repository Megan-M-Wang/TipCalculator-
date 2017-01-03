//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Megan on 12/31/16.
//  Copyright © 2016 Megan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipAmount: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    
   
    @IBAction func findTip(_ sender: Any) {
       
        let tipPercent = [0.15, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        var tipMoney = tipAmount.selectedSegmentIndex
        
        if( tipMoney < 0 || tipMoney > 2 ) {
            tipMoney = 0
        }
        
        let tip = bill * tipPercent[tipMoney]
        let total = bill + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

