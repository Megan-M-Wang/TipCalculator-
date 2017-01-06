//
//  SettingViewController.swift
//  Tip Calculator
//
//  Created by Megan on 1/4/17.
//  Copyright © 2017 Megan. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet weak var tipLabel: UILabel!
    //Percentages
    let tipPercent = [0.15, 0.18, 0.2]
    
    //Recommendation
    let recPercent = [0.05, 0.1, 0.15, 0.25, 0.3]
    
    //Total Label
    @IBOutlet weak var totalDisplay: UILabel!
    
    @IBOutlet weak var recAmount: UISegmentedControl!
    
    //Tip segment control
    @IBOutlet weak var tipAmount: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Get stored data
        let defaults = UserDefaults.standard
        
        if( defaults.bool(forKey: "percent") == true ) {
            let tipLoc = defaults.integer(forKey: "tipLoc")
            tipAmount.selectedSegmentIndex = tipLoc
            recAmount.selectedSegmentIndex = UISegmentedControlNoSegment
            let tip = defaults.double(forKey: "myBill") * tipPercent[tipLoc]
            let total = defaults.double(forKey: "myBill") + tip
            totalDisplay.text = String(format: "$%.2f", total)
            tipLabel.text = String(format: "$%.2f", tip)
            
        }
        
        else {
            let recLoc = defaults.integer(forKey: "recLoc")
            recAmount.selectedSegmentIndex = recLoc
            tipAmount.selectedSegmentIndex = UISegmentedControlNoSegment
            let tip = defaults.double(forKey: "myBill") * recPercent[recLoc]
            let total = defaults.double(forKey: "myBill") + tip
            totalDisplay.text = String(format: "$%.2f", total)
            tipLabel.text = String(format: "$%.2f", tip)

        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func recChange(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        
        let recLoc = recAmount.selectedSegmentIndex
        defaults.set(recLoc, forKey: "recLoc")
        defaults.set(false, forKey: "percent")
        defaults.synchronize()
        tipAmount.selectedSegmentIndex = UISegmentedControlNoSegment
        
        let bill = defaults.double(forKey: "myBill")
        
        let tip = bill * recPercent[recLoc]
        let total = bill + tip
        
        totalDisplay.text = String(format: "$%.2f", total)
        tipLabel.text = String(format: "$%.2f", tip)
        
    }
   
    @IBAction func tipChanged(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        recAmount.selectedSegmentIndex = UISegmentedControlNoSegment
        let tipLoc = tipAmount.selectedSegmentIndex
        defaults.set(tipLoc, forKey: "tipLoc")
        defaults.set(true, forKey: "percent")
        defaults.synchronize()
        
        
        let bill = defaults.double(forKey: "myBill")
        
        let tip = bill * tipPercent[tipLoc]
        let total = bill + tip
        
        totalDisplay.text = String(format: "$%.2f", total)
        tipLabel.text = String(format: "$%.2f", tip)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
