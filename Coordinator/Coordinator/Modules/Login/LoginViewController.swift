//
//  ViewController.swift
//  Coordinator
//
//  Created by ebpearls on 12/07/2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - properties
    let screenView: LoginView
    
    let viewModel: LoginViewModel
    
    weak var authenticatonCoordinator: AuthenticationCoordinator?
    
    // MARK: - initilization
    init(screenView: LoginView, viewModel: LoginViewModel) {
        self.screenView = screenView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - VC Lifecycle
    override func loadView() {
        super.loadView()
        view = screenView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - setup
    private func setup() {
        setUpButton()
    }
    
    // MARK: - setUpButton
    private func setUpButton() {
        
        screenView.signUpButton.addTarget(self, action: #selector(didTappedSignUp), for: .touchUpInside)
        
        screenView.LoginButton.addTarget(self, action: #selector(didTappedLogin), for: .touchUpInside)
        
        screenView.forgetPasswordButton.addTarget(self, action: #selector(didTappedForget), for: .touchUpInside)
    }
    
    // MARK: - didTappedSignUp
    @objc func didTappedSignUp() {
        authenticatonCoordinator?.navigateToSignUp()
    }
    
    // MARK: - didTappedLogin
    @objc func didTappedLogin() {
        authenticatonCoordinator?.navigateTohome(username: screenView.usernameTextField.text ?? "")
    }
    
    // MARK: - didTappedForget
    @objc func didTappedForget() {
        authenticatonCoordinator?.navigateToforgetPassword()
    }
}

