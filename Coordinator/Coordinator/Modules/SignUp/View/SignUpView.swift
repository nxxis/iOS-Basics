//
//  SignUpView.swift
//  Coordinator
//
//  Created by ebpearls on 12/07/2023.
//

import UIKit

class SignUpView: UIView {
    
    // MARK: - UI
    private lazy var SignUpLabel: UILabel = {
        let label = UILabel()
        label.text = "SIGN UP"
        label.font = UIFont.boldSystemFont(ofSize: 60)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var usernameTextField: UITextField = {
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
        addSubview(SignUpLabel)
        addSubview(detailStackView)
        addSubview(signUpButton)
        
        NSLayoutConstraint.activate([
            SignUpLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
            SignUpLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            detailStackView.topAnchor.constraint(equalTo: SignUpLabel.bottomAnchor, constant: 30),
            detailStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 25),
            detailStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -25),
            
            signUpButton.topAnchor.constraint(equalTo: detailStackView.bottomAnchor, constant: 25),
            signUpButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            signUpButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
}
