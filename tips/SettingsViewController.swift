//
//  SettingsViewController.swift
//  tips
//
//  Created by Harpreet Singh on 12/27/15.
//  Copyright © 2015 Harpreet Singh. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet var sliderOne: UISlider!
    @IBOutlet var sliderTwo: UISlider!
    @IBOutlet var sliderThree: UISlider!
    @IBOutlet var oneValue: UILabel!
    @IBOutlet var twoValue: UILabel!
    @IBOutlet var threeValue: UILabel!
    @IBOutlet var tipDefault: UISegmentedControl!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.backgroundColor = UIColor(red: (204/255.0), green: (255/255.0), blue: (204/255.0), alpha: 1.0)
        
        let option1 = defaults.integerForKey("op1")
        let option2 = defaults.integerForKey("op2")
        let option3 = defaults.integerForKey("op3")
        
        tipDefault.selectedSegmentIndex = defaults.integerForKey("tipDefault")

        if(option1 != 0) {
            sliderOne.value = Float(option1)
            oneValue.text = String(option1)
            tipDefault.setTitle("\(option1)%", forSegmentAtIndex: 0)
        } else {
            sliderOne.value = 18.0
            oneValue.text = "18"
        }
        
        if(option2 != 0) {
            sliderTwo.value = Float(option2)
            twoValue.text = String(option2)
            tipDefault.setTitle("\(option2)%", forSegmentAtIndex: 1)
        } else {
            sliderTwo.value = 20.0
            twoValue.text = "20"
        }
        
        if(option3 != 0) {
            sliderThree.value = Float(option3)
            threeValue.text = String(option3)
            tipDefault.setTitle("\(option3)%", forSegmentAtIndex: 2)
        } else {
            sliderThree.value = 22.0
            threeValue.text = "22"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func oneChanged(sender: AnyObject) {
        let value = Int(sliderOne.value)
        oneValue.text = String(value)
        tipDefault.setTitle("\(value)%", forSegmentAtIndex: 0)
        defaults.setInteger(value, forKey: "op1")
        defaults.synchronize()
        
    }
    
    @IBAction func twoChanged(sender: AnyObject) {
        let value = Int(sliderTwo.value)
        twoValue.text = String(value)
        tipDefault.setTitle("\(value)%", forSegmentAtIndex: 1)
        defaults.setInteger(value, forKey: "op2")
        defaults.synchronize()
    }
    
    @IBAction func threeChanged(sender: AnyObject) {
        let value = Int(sliderThree.value)
        threeValue.text = String(value)
        tipDefault.setTitle("\(value)%", forSegmentAtIndex: 2)
        defaults.setInteger(value, forKey: "op3")
        defaults.synchronize()
    }
    
    @IBAction func tipDefaultChanged(sender: AnyObject) {
        defaults.setInteger(tipDefault.selectedSegmentIndex, forKey: "tipDefault")
        defaults.synchronize()
    }
}
