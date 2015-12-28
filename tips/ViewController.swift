//
//  ViewController.swift
//  tips
//
//  Created by Harpreet Singh on 12/15/15.
//  Copyright © 2015 Harpreet Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tipLabel: UILabel!
    @IBOutlet var billField: UITextField!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var tipControl: UISegmentedControl!
    
    var tipPercentages = [0.18, 0.2, 0.22]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
     
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let tipValue1 = defaults.integerForKey("op1")
        let tipValue2 = defaults.integerForKey("op2")
        let tipValue3 = defaults.integerForKey("op3")
        tipControl.selectedSegmentIndex = defaults.integerForKey("tipDefault")

        
        if (tipValue1 != 0) {
            tipControl.setTitle("\(tipValue1)%", forSegmentAtIndex: 0)
            tipPercentages[0] = Double(tipValue1) / 100.0
        }
        
        if (tipValue2 != 0) {
            tipControl.setTitle("\(tipValue2)%", forSegmentAtIndex: 1)
            tipPercentages[1] = Double(tipValue2) / 100.0
        }
        
        if (tipValue3 != 0) {
            tipControl.setTitle("\(tipValue3)%", forSegmentAtIndex: 2)
            tipPercentages[2] = Double(tipValue3) / 100.0
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"

        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

