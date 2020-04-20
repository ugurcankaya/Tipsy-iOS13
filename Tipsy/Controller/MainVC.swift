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
     billTotalTF.inputAccessoryView = toolBar()

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
        
        people = Int(splitLabel.text!)
        amount = (billTotalTF.text! as! NSString).floatValue
       
        
        performSegue(withIdentifier: "presentSegue", sender: nil)
    }
    
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //If the currently triggered segue is the "goToResults" segue.
        if segue.identifier == "presentSegue" {
            
            //Get hold of the instance of the destination VC and type cast it to a ResultViewController.
            let destinationVC = segue.destination as! SecondVC
            destinationVC.tipRate = self.tipRate
            destinationVC.amount = self.amount
            destinationVC.persons = self.people
            
            
            //Set the destination ResultsViewController's properties.
            
        }
    }
    
    
}

extension UIViewController{
    func toolBar() -> UIToolbar{
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.barTintColor = UIColor.init(red: 0/255, green: 25/255, blue: 61/255, alpha: 1)
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let buttonTitle = "Done"
        let cancelButtonTitle = "Cancel"
        let doneButton = UIBarButtonItem(title: buttonTitle, style: .done, target: self, action: #selector(onClickDoneButton))
        let cancelButton = UIBarButtonItem(title: cancelButtonTitle, style: .plain, target: self, action: #selector(onClickCancelButton))
        doneButton.tintColor = .white
        cancelButton.tintColor = .white
        toolBar.setItems([cancelButton, space, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        return toolBar
        
    }

    @objc func onClickDoneButton(){
        view.endEditing(true)
    }

    @objc func onClickCancelButton(){
        view.endEditing(true)
    }
}


