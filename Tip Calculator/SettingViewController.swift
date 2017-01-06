//
//  SettingViewController.swift
//  Tip Calculator
//
//  Created by Megan on 1/4/17.
//  Copyright © 2017 Megan. All rights reserved.
//

import UIKit

/* Class for the second screen of the applicition */
class SettingViewController: UIViewController {
    
    //Vars for user enter field
    @IBOutlet weak var userEnter: UITextField!
    
    //Vars for the tip percentages -- tip label
    // and the array of different percentages
    @IBOutlet weak var tipAmount: UISegmentedControl!
    let tipPercent = [0.15, 0.18, 0.2]
    
    //Vars for the recommendation uisegment and 
    //percentages
    let recPercent = [0.05, 0.1, 0.15, 0.25, 0.3]
    @IBOutlet weak var recAmount: UISegmentedControl!
    
    //Labels for the tips and total
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalDisplay: UILabel!
    
    /* Checks if view loaded and sets up the segment 
       controllers so that they match the previous state */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Get stored data
        let defaults = UserDefaults.standard
        var tip = 0.0
        
        //Restores for the tip percentages
        if( defaults.bool(forKey: "percent") == true ) {
            
            //Extract the location of the selected item and 
            //selects it
            let tipLoc = defaults.integer(forKey: "tipLoc")
            tipAmount.selectedSegmentIndex = tipLoc
            recAmount.selectedSegmentIndex = UISegmentedControlNoSegment
            
            //Calculate tip value
            tip = defaults.double(forKey: "myBill") * tipPercent[tipLoc]
        }
        
        //Otherwise restore the recommendation state
        else {
            
            //Get the selected area of the recommendation
            //uisegment controller
            let recLoc = defaults.integer(forKey: "recLoc")
            recAmount.selectedSegmentIndex = recLoc
            tipAmount.selectedSegmentIndex = UISegmentedControlNoSegment
            
            //Calculate the tip
            tip = defaults.double(forKey: "myBill") * recPercent[recLoc]
        }
        
        //Find the total and display info
        let total = defaults.double(forKey: "myBill") + tip
        totalDisplay.text = String(format: "$%.2f", total)
        tipLabel.text = String(format: "$%.2f", tip)
        
    }

    /* Provided override function */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /* Computes user entered tip */
    @IBAction func userTip(_ sender: Any) {
        //Access stored memory
        let defaults = UserDefaults.standard
        
        //Get the entered number
        let usertip = Double(userEnter.text!) ?? 0
        
        let bill = defaults.double(forKey: "myBill")
        let tip = bill * (usertip / 100.0)
        let total = bill + tip
        
        totalDisplay.text = String(format: "$%.2f", total)
        tipLabel.text = String(format: "$%.2f", tip)
        
        tipAmount.selectedSegmentIndex = UISegmentedControlNoSegment
        recAmount.selectedSegmentIndex = UISegmentedControlNoSegment
    }

    /* Handles the tap functionality */
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(false)
    }
    
    /* Called when the recommendation segment is changed */
    @IBAction func recChange(_ sender: Any) {
        
        //Access stored memory
        let defaults = UserDefaults.standard
        
        //Save selected segment
        let recLoc = recAmount.selectedSegmentIndex
        defaults.set(recLoc, forKey: "recLoc")
        defaults.set(false, forKey: "percent")
        defaults.synchronize()
        
        //Reset tipPercent selection
        tipAmount.selectedSegmentIndex = UISegmentedControlNoSegment
        
        //Calculate and display bill
        let bill = defaults.double(forKey: "myBill")
        let tip = bill * recPercent[recLoc]
        let total = bill + tip
        
        totalDisplay.text = String(format: "$%.2f", total)
        tipLabel.text = String(format: "$%.2f", tip)
    }
   
    /* Called when tip percentage selection is changed */
    @IBAction func tipChanged(_ sender: Any) {
        //Access stored defaults
        let defaults = UserDefaults.standard
        
        //Reset recommendation segment
        recAmount.selectedSegmentIndex = UISegmentedControlNoSegment
        
        //Save the selected space
        let tipLoc = tipAmount.selectedSegmentIndex
        defaults.set(tipLoc, forKey: "tipLoc")
        defaults.set(true, forKey: "percent")
        defaults.synchronize()
        
        //Calculate and display total and tip
        let bill = defaults.double(forKey: "myBill")
        
        let tip = bill * tipPercent[tipLoc]
        let total = bill + tip
        
        totalDisplay.text = String(format: "$%.2f", total)
        tipLabel.text = String(format: "$%.2f", tip)
        
    }

}
