//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Gerdin Ventura on 12/26/20.
//  Copyright © 2020 Gerdin Ventura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var test: UILabel!
    @IBOutlet weak var billField: UITextField!
   
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var baba: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!

    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    @IBAction func calculateTip(_ sender: Any) {
            //Get bill amount
            let bill = Double(billField.text!) ?? 0

            //Calculate the tip and total
            let tipPercentages = [0.15, 0.18, 0.2]
            let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
            let total = bill + tip

            //Update the tip and total labels
            tipLabel.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format: "$%.2f", total)
    }
   
   
}

