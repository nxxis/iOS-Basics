//
//  ViewController.swift
//  Data Parsing VC
//
//  Created by ebpearls on 11/05/2023.
//

import UIKit


class LandingPageController: UIViewController {
    // MARK: - Properties
    
    // MARK: - UIs
    /// firstname
    private lazy var firstNameLabel: UILabel = {
        let label = UILabel()
        label.text = "First Name:"
        label.textColor = .blue
        label.setContentHuggingPriority(.defaultHigh+30, for: .horizontal)
        return label
    }()
    
    private lazy var firstNameTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.backgroundColor = .white
        return textField
    }()
    
    private lazy var firstNameStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstNameLabel, firstNameTextField])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 50
        return stackView
    }()
    
    /// lastname
    private lazy var lastNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Last Name:"
        label.textColor = .blue
        label.setContentHuggingPriority(.defaultHigh+30, for: .horizontal)
        return label
    }()
    
    private lazy var lastNameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.textColor = .black
        return textField
    }()
    
    private lazy var lastNameStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [lastNameLabel, lastNameTextField])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 50
        return stackView
    }()
    
    /// age
    private lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.text = "Age:            "
        label.textColor = .blue
        label.setContentHuggingPriority(.defaultHigh+30, for: .horizontal)
        return label
    }()
    
    private lazy var ageTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.keyboardType = .numberPad
        return textField
    }()
    
    private lazy var ageStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [ageLabel, ageTextField])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 50
        return stackView
    }()
    
    /// address
    private lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Address:    "
        label.textColor = .blue
        label.setContentHuggingPriority(.defaultHigh+30, for: .horizontal)
        return label
    }()
    
    private lazy var addressTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.textColor = .black
        return textField
    }()
    
    private lazy var addressStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [addressLabel, addressTextField])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 50
        return stackView
    }()
    
    /// mainStackView
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstNameStackView,lastNameStackView,ageStackView,addressStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    // MARK: - Button
    private lazy var submitButton: UIButton = {
        let submitButton = UIButton()
        submitButton.backgroundColor = .white
        submitButton.setTitle("Submit", for: .normal)
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.backgroundColor = .gray
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        return submitButton
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup ()
        
    }
    // MARK: - Setup
    
    private func setup () {
        
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        
        // MARK: - Profile Page
        view.backgroundColor = .lightGray
        title = "Create Profile"
        
        //        // MARK: - Label
        //        view.addSubview(firstNameLabel)
        //        firstNameLabel.frame = CGRect(x: 25, y: 120, width: 90, height: 30)
        //
        //        view.addSubview(lastNameLabel)
        //        lastNameLabel.frame = CGRect(x: 25, y: 170, width: 90, height: 30)
        //
        //        view.addSubview(ageLabel)
        //        ageLabel.frame = CGRect(x: 25, y: 220, width: 90, height: 30)
        //
        //        view.addSubview(addressLabel)
        //        addressLabel.frame = CGRect(x: 25, y: 270, width: 90, height: 30)
        //
        //        // MARK: - Text Field
        //        view.addSubview(firstNameTextField)
        //        firstNameTextField.frame = CGRect(x: 120, y: 120, width: 190, height: 30)
        //
        //        view.addSubview(lastNameTextField)
        //        lastNameTextField.frame = CGRect(x: 120, y: 170, width: 190, height: 30)
        //
        //        view.addSubview(ageTextField)
        //        ageTextField.frame = CGRect(x: 120, y: 220, width: 190, height: 30)
        //
        //        view.addSubview(addressTextField)
        //        addressTextField.frame = CGRect(x: 120, y: 270, width: 190, height: 30)
        //
                 //MARK: - Button
                
        
        view.addSubview(mainStackView)
        
        mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 35).isActive = true
        mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 45).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -45).isActive = true
        
        view.addSubview(submitButton)
NSLayoutConstraint.activate([
    submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    submitButton.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 50)
])
        
//        mainStackView.widthAnchor.constraint(equalToConstant: 90).isActive = true
//        mainStackView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        
    }
    
    @objc private func submitButtonTapped() {
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let address = addressTextField.text ?? ""
        var age: Int = 0
        if let ageValue = Int(ageTextField.text ?? "") {
            age = ageValue
        }
        let person1 = Person(fName: firstName, lName: lastName, age: age, address: address)
        let obj = DisplayController(personDetails: person1)
        navigationController?.pushViewController(obj, animated: true)
        
    }
    
}
class Person {
    let fName: String
    let lName: String
    let age: Int
    let address: String
    
    init(fName: String, lName: String, age: Int, address: String) {
        self.fName = fName
        self.lName = lName
        self.age = age
        self.address = address
    }
    
}


