//
//  ViewController.swift
//  AutoLayout
//
//  Created by ebpearls on 17/05/2023.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI
    private lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Log in"
        label.textColor = .white
        label.font = label.font.withSize(label.font.pointSize + 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "CASTLE"
        label.textColor = .green
        label.font = label.font.withSize(label.font.pointSize + 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subLabel: UILabel = {
        let label = UILabel()
        label.text = "RESIDENCES"
        label.textColor = .green
        label.font = label.font.withSize(label.font.pointSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Username"
        label.textColor = .white
        return label
    }()
    
    private lazy var forgotPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Forgot Password?"
        label.textColor = .green
        return label
    }()
    
    
    private lazy var usernameTextfield: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = .white
        textfield.textColor = .black
        return textfield
    }()
    
    private lazy var usernameStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [usernameLabel,usernameTextfield])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 5
        return stackView
    }()
    
    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.textColor = .white
        return label
    }()
    
    private lazy var passwordTextfield: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var passwordStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [passwordLabel,passwordTextfield])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 5
        return stackView
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var bgImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private lazy var bgBlur: UIVisualEffectView = {
        let blur = UIBlurEffect(style: .light)
        let eBlur = UIVisualEffectView(effect: blur)
        eBlur.translatesAutoresizingMaskIntoConstraints = false
        return eBlur
        
    }()
    
    private lazy var mainStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [usernameStackView,passwordStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 20
        return stackView
        
    }()
    
    private lazy var mainStack1: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [usernameStackView,passwordStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 20
        return stackView
        
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private lazy var contentView: UIView = {
        let newView = UIView()
        newView.translatesAutoresizingMaskIntoConstraints = false
        return newView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(bgImage)
        bgImage.addSubview(bgBlur)
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(loginLabel)
        contentView.addSubview(mainLabel)
        contentView.addSubview(subLabel)
        contentView.addSubview(forgotPasswordLabel)
        contentView.addSubview(mainStack)
        contentView.addSubview(loginButton)
        
        //        contentView.addSubview(mainStack1)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            bgImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bgImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bgImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            bgImage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bgBlur.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bgBlur.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bgBlur.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            bgBlur.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            
            mainLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            mainLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 60),
            
            subLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 120),
            subLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            loginLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            loginLabel.topAnchor.constraint(equalTo: subLabel.bottomAnchor, constant: 210),
            
            mainStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 35),
            mainStack.topAnchor.constraint(equalTo: subLabel.bottomAnchor, constant: 310),
            mainStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -45),
            
            
            loginButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: mainStack.bottomAnchor, constant: 400),
            loginButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -400),
        ])
        
        
    }
    
    @objc func loginButtonTapped() {
        print("buttonTapped")
    }
    
    
}

