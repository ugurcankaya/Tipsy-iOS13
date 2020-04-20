//
//  MainVC.swift
//  Tipsy
//
//  Created by UGURCAN KAYA on 4/20/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    
    @IBOutlet var billTotalTF: UITextField!

    @IBOutlet var tipBox0: UIButton!
    @IBOutlet var tipBox10: UIButton!
    @IBOutlet var tipBox20: UIButton!
    @IBOutlet var stepBox1: UIStepper!
    @IBOutlet var splitLabel: UILabel!
    
    
    var amount:Float?
    var tipRate:Float = 0.10
    var people:Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func stepBox1_Changed(_ sender: UIStepper) {
        splitLabel.text = String(Int( stepBox1.value))
    }
    
    @IBAction func tipBoxPressed(_ sender: UIButton) {
        tipBox0.isSelected = false
        tipBox10.isSelected = false
        tipBox20.isSelected = false
        
        sender.isSelected = true
        switch sender.tag {
        case 0:
            tipRate = 0.0
        case 10:
            tipRate = 0.10
            break
        case 20:
            tipRate = 0.20
            break
        default:
            break
        
        }
        
    }
   
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        print(tipRate)
        print(billTotalTF.text ?? "0.0")
        people = Int(splitLabel.text!)
        
        print("Total Bill: \(billTotalTF.text ?? "0") and Tip Rate: \(tipRate*10) and People : \(people)")
        
        
    }
    
  

}
