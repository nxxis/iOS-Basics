//
//  ForgetPasswordViewController.swift
//  Coordinator
//
//  Created by ebpearls on 12/07/2023.
//

import UIKit

class ForgetPasswordViewController: UIViewController {
    // MARK: - properties
    let screenView: ForgetPasswordView
    
    let viewModel: ForgetPasswordViewModel
    
    weak var authenticationCoordinator: AuthenticationCoordinator?
    
    // MARK: - initilization
    init(screenView: ForgetPasswordView, viewModel: ForgetPasswordViewModel) {
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
