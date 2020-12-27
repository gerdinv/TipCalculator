//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Gerdin Ventura on 12/26/20.
//  Copyright © 2020 Gerdin Ventura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var percentage = 0.00;
    var bill = 0.00;
    var splitNum = 1.00;
    
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipPercentage: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var splitTotalLabel: UILabel!
    @IBOutlet weak var splitControl: UISlider!
    @IBOutlet weak var splitLabel: UILabel!
    
    @IBOutlet weak var topContentContainer: UIView!
    @IBOutlet weak var middleContentContainer: UIView!
    @IBOutlet weak var bottomContentContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topContentContainer.layer.cornerRadius = 15
        topContentContainer.layer.masksToBounds = true
        topContentContainer.layer.borderWidth = 1.5
        topContentContainer.layer.borderColor = UIColor.black.cgColor
        
        middleContentContainer.layer.cornerRadius = 15
        middleContentContainer.layer.masksToBounds = true
        middleContentContainer.layer.borderWidth = 1.5
        middleContentContainer.layer.borderColor = UIColor.black.cgColor
        
        bottomContentContainer.layer.cornerRadius = 15
        bottomContentContainer.layer.masksToBounds = true
        bottomContentContainer.layer.borderWidth = 1.5
        bottomContentContainer.layer.borderColor = UIColor.black.cgColor
        
        tipSlider.maximumValue = 100;
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    //calculates the tip % from the slider
    @IBAction func updateTip(_ sender: UISlider) {
        percentage = Double(Int(sender.value))
        bill = calcTotal(percentage: percentage)
        
        updateLabels(bill: bill, splitNum: splitNum, percentage: percentage)
        
        tipControl.selectedSegmentIndex = UISegmentedControl.noSegment
    }
    
    //Calculates tip % when selecting from segment
    @IBAction func updateTipFromSegment(_ sender: Any) {
        let tipPercentages = [15, 18, 20]
        
        percentage = Double(tipPercentages[tipControl.selectedSegmentIndex])
        bill = calcTotal(percentage: percentage)
        
        updateLabels(bill: bill, splitNum: splitNum, percentage: percentage)
        
        //Animates the slider to match the percentage selected from segment
        UIView.animate(withDuration: 0.8, delay: 0.0, options: [], animations: {
            self.tipSlider.setValue(Float(self.percentage), animated: true) },
        completion: nil)
    }
    
    //Calculates total tip when writing in text field
    @IBAction func calculateTip(_ sender: Any) {
        bill = calcTotal(percentage: percentage)
        updateLabels(bill: bill, splitNum: splitNum, percentage: percentage)
    }
    
    //Updates the split number from slider
    @IBAction func updateSplit(_ sender: UISlider) {
        splitNum = Double(Int(sender.value))
        splitLabel.text = String(Int(splitNum))
        splitTotalLabel.text = String(format: "$%.2f", (bill / splitNum))
    }
    
    //Updates labels
    func updateLabels(bill: Double, splitNum: Double, percentage: Double) {
        tipPercentage.text = String("\(percentage)%")
        splitTotalLabel.text = String(format: "$%.2f", (bill / splitNum))
        totalLabel.text = String(format: "$%.2f", bill)
    }
    
    //Caclulates the total Bill
    func calcTotal( percentage: Double) -> Double{
        bill = Double(billField.text!) ?? 0
        return bill + (bill * Double(percentage / 100))
    }
}

