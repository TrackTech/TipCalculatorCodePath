//
//  ViewController.swift
//  TipCalCodePath
//
//  Created by rushikesh on 3/5/17.
//  Copyright © 2017 rushikesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipSegment: UISegmentedControl!
    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    var tipPercentage = [0.1,0.15,0.2]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let bill = Double(billAmount.text!) ?? 0.00
        let tip = bill * tipPercentage[tipSegment.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f",tip)
        totalLabel.text = String(format: "$%0.2f", total)
        
    }
	
    @IBAction func tapMe(_ sender: Any) {
        
        view.endEditing(true);
    }
    @IBAction func onSegmentChange(_ sender: Any) {
        let bill = Double(billAmount.text!) ?? 0.00
        let tip = bill * tipPercentage[tipSegment.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f",tip)
        totalLabel.text = String(format: "$%0.2f", total)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        var standardValue = defaults.integer(forKey: "standardVal")
        
        var veryGoodValue = defaults.integer(forKey: "veryGoodVal")
        
        var madeMyDayValue = defaults.integer(forKey: "madeMyDayVal")
        
        
        if standardValue==0 {
            standardValue=10
        }
        if(veryGoodValue==0){
            veryGoodValue=15
        }
        if(madeMyDayValue==0){
            madeMyDayValue=20
        }
        tipPercentage[0] = Double(standardValue) / 100
        
        tipPercentage[1] = Double(veryGoodValue) / 100
        tipPercentage[2] = Double(madeMyDayValue) / 100
        
        tipSegment.setTitle(String(standardValue), forSegmentAt:0)
        
        tipSegment.setTitle(String(veryGoodValue), forSegmentAt:1)
        
        tipSegment.setTitle(String(madeMyDayValue), forSegmentAt:2)
        
    }
}
