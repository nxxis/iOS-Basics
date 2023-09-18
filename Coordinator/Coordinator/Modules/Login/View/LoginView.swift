//
//  LoginView.swift
//  Coordinator
//
//  Created by ebpearls on 12/07/2023.
//

import UIKit

class LoginView: UIView {
    
    // MARK: - UI
    private lazy var LoginLabel: UILabel = {
        let label = UILabel()
        label.text = "LOGIN"
        label.font = UIFont.boldSystemFont(ofSize: 60)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.borderStyle = .line
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .line
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var forgetPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forget Password?", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var detailStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [usernameTextField, passwordTextField])
        view.axis = .vertical
        view.spacing = 30
        view.distribution = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.layer.cornerRadius = 6
        button.backgroundColor = .systemBlue
        return button
    }()
    
    lazy var LoginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.layer.cornerRadius = 6
        button.backgroundColor = .systemRed
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let hStack = UIStackView(arrangedSubviews: [LoginButton, signUpButton])
        hStack.axis = .horizontal
        hStack.distribution = .fillEqually
        hStack.spacing = 25
        hStack.translatesAutoresizingMaskIntoConstraints = false
        return hStack
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
        addSubview(LoginLabel)
        addSubview(detailStackView)
        addSubview(forgetPasswordButton)
        addSubview(buttonStackView)
        
        NSLayoutConstraint.activate([
            LoginLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
            LoginLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            detailStackView.topAnchor.constraint(equalTo: LoginLabel.bottomAnchor, constant: 35),
            detailStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 25),
            detailStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -25),
            
            forgetPasswordButton.topAnchor.constraint(equalTo: detailStackView.bottomAnchor),
            forgetPasswordButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 220),
            forgetPasswordButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -25),
            
            buttonStackView.topAnchor.constraint(equalTo: forgetPasswordButton.bottomAnchor, constant: 35),
            buttonStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 25),
            buttonStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -25),
            
        ])
    }
}
