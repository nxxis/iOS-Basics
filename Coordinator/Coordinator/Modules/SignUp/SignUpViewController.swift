//
//  SignUpViewController.swift
//  Coordinator
//
//  Created by ebpearls on 12/07/2023.
//

import UIKit

class SignUpViewController: UIViewController {
    
    // MARK: - properties
    let screenView: SignUpView
    
    let viewModel: SignUpViewModel
    
    weak var authenticationCoordinator: AuthenticationCoordinator?
    
    // MARK: - initilization
    init(screenView: SignUpView, viewModel: SignUpViewModel) {
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
    }
}
