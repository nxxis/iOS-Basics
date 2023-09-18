//
//  FirstViewController.swift
//  ViewControllerPractice
//
//  Created by ebpearls on 09/05/2023.
//

import UIKit

class FirstViewController: UIViewController {
    
    // MARK: - Properties
    //used inside onPressedChangeColor function
    var flag = true
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBOutlet fileprivate weak var storeTextLabel: UILabel!
    
    @IBOutlet fileprivate weak var outputLabel: UILabel!
    
    @IBOutlet fileprivate weak var saveDetailsButton: UIButton!
    
    @IBOutlet fileprivate weak var changeColorButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onPressedFirstButton(_ sender: UIButton) {
        
        
        firstNameTextField.text = "Partha"
        lastNameTextField.text = "Chalise"
        addressTextField.text = "Hattiban"
        storeTextLabel.text = "Here are your details:"
        storeTextLabel.textColor = .brown
        outputLabel.text = "My name is \(firstNameTextField.text!)" + " " + "\(lastNameTextField.text!)" + " " + "and I live in \(addressTextField.text!)"
        
        print("GetDetails Button is pressed")
        
        print("My name is \(firstNameTextField.text!)" + " " + "\(lastNameTextField.text!)" + " " + "and I live in \(addressTextField.text!)")
    }
    
    
    @IBAction func onPressedChangeColor(_ sender: UIButton) {
        
        switch flag {
        case false:
            sender.setTitle("ChangeColor", for: .normal)
            storeTextLabel.textColor = .black
            flag = true
            
        case true:
            sender.setTitle("Revert", for: .normal)
            storeTextLabel.textColor = .brown
            flag = false
            
        }

        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
}
