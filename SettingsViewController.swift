//
//  SettingsViewController.swift
//  TipCalCodePath
//
//  Created by rushikesh on 3/5/17.
//  Copyright © 2017 rushikesh. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var mademyday: UITextField!
    @IBOutlet weak var verygood: UITextField!
    @IBOutlet weak var standar: UITextField!
    @IBOutlet var onTap: UITapGestureRecognizer!
    @IBOutlet weak var lblSettingsSaved: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onTapScreen(_ sender: Any) {
        view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        lblSettingsSaved.alpha=0.0

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
        
        standar.text =  String(format: "%d", standardValue as CVarArg)//(standardValue as! String)
        
        verygood.text = String(format: "%d", veryGoodValue as CVarArg) //(veryGoodValue as! String)
        
        mademyday.text = String(format:"%d",madeMyDayValue as CVarArg)//(madeMyDayValue as! String)
        
        
    }
    @IBAction func SaveClicked(_ sender: Any) {
        print("save clicked")
        let defaults = UserDefaults.standard
        
        print (standar.text!)
        
        let s = Int(standar.text!) ?? 10
        
        print (s)
        
        defaults.set(s, forKey: "standardVal")
        
        defaults.set((Int(verygood.text!) ?? 15), forKey: "veryGoodVal")
        
        defaults.set((Int(mademyday.text!) ?? 20), forKey: "madeMyDayVal")
        
        defaults.synchronize()
        
        /*UIView.animate(withDuration: 2.0, animations: {
            self.lblSettingsSaved.alpha=0.4
        } ,completion: {
            (value:Bool) in self.lblSettingsSaved.alpha=0.0
        }) */
        UIView.animate(withDuration: 2.0, animations: {
            self.lblSettingsSaved.alpha=0.4
        } ,completion: {
            (value:Bool) in
            UIView.animate(withDuration: 2.0, animations: {
                self.lblSettingsSaved.alpha=0.0
            })
        })
        
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
