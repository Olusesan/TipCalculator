//
//  settingsViewController.swift
//  tips
//
//  Created by Olusesan Ajina on 5/26/15.
//  Copyright (c) 2015 Sesan Ajina. All rights reserved.
//

import UIKit

class settingsViewController: UIViewController {
    

    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    var userDefaults : NSUserDefaults?
    let tipPercent = [ 18, 20, 25]
    var defaultTip: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure outlets' appearance and corner edges
        
        displayLabel.backgroundColor = UIColor (red: 85.0/255, green: 60.0/255, blue: 100.0/255, alpha: 0.7)
       displayLabel.layer.cornerRadius = 6.0
        doneButton.layer.cornerRadius = 6.0
        doneButton.backgroundColor = UIColor (red: 85.0/255, green: 60.0/255, blue: 100.0/255, alpha: 0.7)

        tipControl.layer.cornerRadius = 6.0
        tipControl.tintColor = UIColor (red: 90.0/255, green: 60.0/255, blue: 100.0/255, alpha: 0.9)
        
        //      Load default tip value key
        
        userDefaults = NSUserDefaults.standardUserDefaults()
        let defaultTip = userDefaults?.integerForKey("defaulTip")
        tipControl.selectedSegmentIndex = 0
        for (index,selectedSegment) in enumerate(tipPercent) {
            if(defaultTip == selectedSegment){
                tipControl.selectedSegmentIndex = index
            }
        }
        // Do any additional setup after loading the view.
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func dissmiss(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
//   Save default tip value key
    
    override func viewWillDisappear(animated: Bool) {
        let currTip = tipPercent[tipControl.selectedSegmentIndex]
        userDefaults?.setInteger(currTip, forKey: "defaultTip")
        userDefaults?.synchronize()
        super.viewWillDisappear(animated)
        
        println("view will disappear")
    }
    
    
    

}

