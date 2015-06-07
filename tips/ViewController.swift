//
//  ViewController.swift
//  tips
//
//  Created by Olusesan Ajina on 5/15/15.
//  Copyright (c) 2015 Sesan Ajina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var barView: UIView!

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billsTextField: UITextField!
    @IBOutlet weak var tipsLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    var userDefaults : NSUserDefaults?
    let tipPercent = [ 18, 20, 25]
    var tipValue: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        tipsLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
// Configure outlets' appearance and corner edges
        
        barView.backgroundColor = UIColor (red: 90.0/255, green: 60.0/255, blue: 100.0/255, alpha: 0.8)

        tipsLabel.tintColor = UIColor(red: 92.0/255, green: 69.0/255, blue: 123.0/255, alpha: 0.5)
        billsTextField.layer.borderColor = UIColor.redColor().CGColor
        tipControl.layer.cornerRadius = 6.0
        tipControl.tintColor = UIColor (red: 90.0/255, green: 60.0/255, blue: 100.0/255, alpha: 0.9)
        tipControl.selectedSegmentIndex = 0
        
        // Do any additional setup after loading the view, typically from a nib.
        
//      Load default tip value
        
        userDefaults = NSUserDefaults.standardUserDefaults()
        tipValue = userDefaults?.integerForKey("defaultTip")
        for (index,selectedIndex) in enumerate(tipPercent) {
            if(tipValue == selectedIndex){
                tipControl.selectedSegmentIndex = index
            }
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
//        Create a billAmount variable and pass into textField as string
        var billAmount = (billsTextField.text as NSString).doubleValue
        
//        Create a total Variable that holds results and pass into totalLabel as string
        var total = billAmount + billAmount * (Double (tipPercent[tipControl.selectedSegmentIndex])/100)
        tipsLabel.text = String (format: "$%.2f", billAmount * Double (tipPercent[tipControl.selectedSegmentIndex])/100)
        totalLabel.text = String (format: "$%.2f", total)
        
        
    }
    
    @IBAction func settingsTapped(sender: AnyObject) {
        performSegueWithIdentifier("segue", sender: self)
    }
    
    @IBAction func viewTapped(sender: AnyObject) {
        view.endEditing(true)
    }
    override func viewWillAppear(animated: Bool) {

        
//        Load dafault tip value from settingsViewController
        
        tipValue = userDefaults?.integerForKey("defaultTip")
        for (index,selectedSegment) in enumerate(tipPercent) {
            if(tipValue == selectedSegment){
                tipControl.selectedSegmentIndex = index
            }
        }
        onEditingChanged(self)
        
        println("view will appear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
       
        
        println("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        

        println("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        println("view did disappear")
    }


}





