//
//  MainScreen.swift
//  DataParsingToViewTable
//
//  Created by ebpearls on 29/05/2023.
//

import UIKit

class FormView: UIView {
    
    // MARK: - UI
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Full Name:"
        return label
    }()
    
    lazy var nameField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray4
        textField.placeholder = "Enter your full name"
        textField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        return textField
    }()
    
    ///nameLabel and FieldStack
    private lazy var nameStackView: UIStackView = {
        let hStack = UIStackView(arrangedSubviews: [nameLabel, nameField])
        hStack.axis = .vertical
        hStack.spacing = 5
        hStack.alignment = .fill
        hStack.distribution = .fill
        return hStack
    }()
    
    private lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Address:"
        label.textColor = .black
        return label
    }()
    
    lazy var addressField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.backgroundColor = .systemGray4
        textField.placeholder = "Enter your address"
        textField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        return textField
    }()
    
    ///addressLabel and Field Stack
    private lazy var addressStackView: UIStackView = {
        let hStack = UIStackView(arrangedSubviews: [addressLabel, addressField])
        hStack.axis = .vertical
        hStack.spacing = 5
        hStack.alignment = .fill
        hStack.distribution = .fill
        return hStack
    }()
    
    private lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "Phone Number:"
        label.textColor = .black
        return label
    }()
    
    lazy var phoneField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.backgroundColor = .systemGray4
        textField.placeholder = "Enter your phone number"
        textField.keyboardType = .numberPad
        textField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        return textField
    }()
    
    ///phoneLabel and FieldStack
    private lazy var phoneNumberStackView: UIStackView = {
        let vStack = UIStackView(arrangedSubviews: [phoneLabel, phoneField])
        vStack.axis = .vertical
        vStack.spacing = 5
        vStack.alignment = .fill
        vStack.distribution = .fill
        return vStack
    }()
    
    ///main stack
    private lazy var mainStack: UIStackView = {
        let vMainStack = UIStackView(arrangedSubviews: [nameStackView, addressStackView, phoneNumberStackView])
        vMainStack.axis = .vertical
        vMainStack.spacing = 15
        vMainStack.distribution = .fill
        vMainStack.alignment = .fill
        vMainStack.translatesAutoresizingMaskIntoConstraints = false
        return vMainStack
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .systemGray4
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var showButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .systemGray4
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var UpdateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Update", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .systemGray4
        button.layer.cornerRadius = 5
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - View Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setup
    private func setup() {
        backgroundColor = .white
        
        generateChild()
    }
    
    private func generateChild() {
        addSubview(mainStack)
        addSubview(addButton)
        addSubview(showButton)
        addSubview(UpdateButton)
        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            mainStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            addButton.widthAnchor.constraint(equalToConstant: 50),
            addButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 130),
            addButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            
            UpdateButton.widthAnchor.constraint(equalToConstant: 80),
            UpdateButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 100),
            UpdateButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            
            showButton.widthAnchor.constraint(equalToConstant: 60),
            showButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            showButton.leadingAnchor.constraint(equalTo: addButton.trailingAnchor, constant: 30),
        ])
    }
}

