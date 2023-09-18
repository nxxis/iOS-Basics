//
//  ForgetPasswordView.swift
//  Coordinator
//
//  Created by ebpearls on 12/07/2023.
//

import UIKit

class ForgetPasswordView: UIView {
    
    // MARK: - UI
    private lazy var ResetLabel: UILabel = {
        let label = UILabel()
        label.text = "RESET"
        label.font = UIFont.boldSystemFont(ofSize: 60)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "enter registered email"
        textField.borderStyle = .line
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var ResetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.layer.cornerRadius = 6
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - View Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setup
    private func setup() {
        generateChild()
    }
    
    // MARK: - generateChild
    private func generateChild() {
        addSubview(ResetLabel)
        addSubview(emailTextField)
        addSubview(ResetButton)
        
        NSLayoutConstraint.activate([
            ResetLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
            ResetLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: ResetLabel.bottomAnchor, constant: 30),
            emailTextField.centerXAnchor.constraint(equalTo: ResetLabel.centerXAnchor),
            emailTextField.widthAnchor.constraint(equalToConstant: 350),
            
            ResetButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 25),
            ResetButton.centerXAnchor.constraint(equalTo: ResetLabel.centerXAnchor),
            ResetButton.widthAnchor.constraint(equalToConstant: 70),
            
        ])
    }
    
}
