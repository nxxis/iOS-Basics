//
//  SecondViewController.swift
//  ViewControllerPractice
//
//  Created by ebpearls on 09/05/2023.
//

import UIKit

class SecondViewController: UIViewController {
    
    let firstNameLabel = UILabel()
    let lastNameLabel = UILabel()
    let ageLabel = UILabel()
    let addressLabel = UILabel()
    let firstNameTextField = UITextField()
    let lastNameTextField = UITextField()
    let ageTextField = UITextField()
    let addressTextField = UITextField()
    let submitButton = UIButton()
    
    
//    var firstname: String = ""
//    var lastname: String = ""
//    var age: Int = 0
//    var address: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - Profile Page
        view.backgroundColor = .lightGray
        title = "Profile"
        
        // MARK: - Label
        
        firstNameLabel.text = "First Name:"
        firstNameLabel.frame = CGRect(x: 25, y: 120, width: 90, height: 30)
        firstNameLabel.textColor = .blue
        //firstNameLabel.backgroundColor = .white
        view.addSubview(firstNameLabel)
        
        
        lastNameLabel.text = "Last Name:"
        lastNameLabel.frame = CGRect(x: 25, y: 170, width: 90, height: 30)
        lastNameLabel.textColor = .blue
        view.addSubview(lastNameLabel)
        
        
        ageLabel.text = "Age:"
        ageLabel.frame = CGRect(x: 25, y: 220, width: 90, height: 30)
        ageLabel.textColor = .blue
        view.addSubview(ageLabel)
        
        
        addressLabel.text = "Address:"
        addressLabel.frame = CGRect(x: 25, y: 270, width: 90, height: 30)
        addressLabel.textColor = .blue
        view.addSubview(addressLabel)
        
        // MARK: - Text Field
       
        firstNameTextField.backgroundColor = .white
        firstNameTextField.frame = CGRect(x: 120, y: 120, width: 190, height: 30)
        firstNameTextField.textColor = .black
        view.addSubview(firstNameTextField)
        
        lastNameTextField.backgroundColor = .white
        lastNameTextField.frame = CGRect(x: 120, y: 170, width: 190, height: 30)
        lastNameTextField.textColor = .black
        view.addSubview(lastNameTextField)
        
        
        ageTextField.backgroundColor = .white
        ageTextField.frame = CGRect(x: 120, y: 220, width: 190, height: 30)
        ageTextField.textColor = .black
        view.addSubview(ageTextField)
    
       
        addressTextField.backgroundColor = .white
        addressTextField.frame = CGRect(x: 120, y: 270, width: 190, height: 30)
        addressTextField.textColor = .black
        view.addSubview(addressTextField)
        
        
        // MARK: - Button
        
        submitButton.setTitle("Submit", for: .normal)
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.frame = CGRect(x: 160, y: 370, width: 80, height: 40)
        submitButton.backgroundColor = .gray
        view.addSubview(submitButton)
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        
        
        //outputLabel.text = "My name is \(firstname)" + " " + "\(lastname)." + "I Live in \(address)." + "My age is \(age)"
        
        

    }
    

    

    
    @objc private func submitButtonTapped() {
        let outputLabel = UILabel()
        outputLabel.frame = CGRect(x: 25, y: 450, width: 380, height: 30)
        outputLabel.textColor = .blue
        outputLabel.lineBreakMode = .byWordWrapping
        outputLabel.numberOfLines = 3
        view.addSubview(outputLabel)
        outputLabel.text = "My name is \(firstNameTextField.text!)" + " " + "\(lastNameTextField.text!)." + "I Live in \(addressTextField.text!)." + "My age is \(ageTextField.text!)"
        
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
