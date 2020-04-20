//
//  SecondVC.swift
//  Tipsy
//
//  Created by UGURCAN KAYA on 4/20/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var destLabel: UILabel!
    var tipRate:Float?
    var amount:Float?
    var persons:Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let result:Float = Float( ((amount!*tipRate!) + amount!) / Float(persons!))
        destLabel.text = "Split between \(persons ?? 0), people with \(Int(tipRate!*100))% tips."
        resultLabel.text = String(result)
    }
    
    @IBAction func reCalculatePressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: {
            print("Dismissed")
        })
    }
    
    

}
