//
//  FormView.swift
//  DelegateAndMVC
//
//  Created by ebpearls on 31/05/2023.
//

import UIKit

class FormView: UIView {
    // MARK: - UI
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Full Name:"
        label.translatesAutoresizingMaskIntoConstraints = false
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
    
    private lazy var bioLabel: UILabel = {
        let label = UILabel()
        label.text = "Bio:"
        label.textColor = .black
        return label
    }()
    
    lazy var bioTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .systemGray4
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = .systemFont(ofSize: 16)
        textView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        return textView
    }()
    
    private lazy var bioStackView: UIStackView = {
        let vStack = UIStackView(arrangedSubviews: [bioLabel, bioTextView])
        vStack.axis = .vertical
        vStack.spacing = 5
        vStack.alignment = .fill
        vStack.distribution = .fill
        return vStack
    }()
    
    ///main stack
    private lazy var mainStack: UIStackView = {
        let vMainStack = UIStackView(arrangedSubviews: [nameStackView, addressStackView, phoneNumberStackView, bioStackView])
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
    
    private lazy var favButtonLabel: UILabel = {
        let label = UILabel()
        label.text = "Add to Favourite?"
        label.textColor = .black
        return label
    }()
    
    lazy var favSwitch: UISwitch = {
        let favSwitch = UISwitch()
        favSwitch.translatesAutoresizingMaskIntoConstraints = false
        return favSwitch
    }()
    
    private lazy var favSwitchStackView: UIStackView = {
        let favSwitchStack = UIStackView(arrangedSubviews: [favButtonLabel, favSwitch])
        favSwitchStack.axis = .horizontal
        favSwitchStack.spacing = 8
        favSwitchStack.distribution = .fill
        favSwitchStack.alignment = .trailing
        favSwitchStack.translatesAutoresizingMaskIntoConstraints = false
        return favSwitchStack
    }()
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - View LifeCycle
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
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(mainStack)
        containerView.addSubview(favSwitchStackView)
        containerView.addSubview(addButton)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            mainStack.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            mainStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            mainStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            
            favSwitchStackView.topAnchor.constraint(equalTo: mainStack.bottomAnchor,constant: 20),
            favSwitchStackView.leadingAnchor.constraint(equalTo: mainStack.leadingAnchor),
            favSwitchStackView.trailingAnchor.constraint(equalTo: mainStack.trailingAnchor),
            
            addButton.widthAnchor.constraint(equalToConstant: 50),
            addButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            addButton.topAnchor.constraint(equalTo: favSwitch.bottomAnchor, constant: 45),
            addButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -25),
            
            nameLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width-40),
        ])
    }
}
