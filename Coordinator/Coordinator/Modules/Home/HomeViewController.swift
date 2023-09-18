//
//  HomeViewController.swift
//  Coordinator
//
//  Created by ebpearls on 12/07/2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - properties
    let screenView: HomeView
    
    let viewModel: HomeViewModel
    
    weak var homeCoordinator: HomeCoordinator?
    
    // MARK: - initilization
    init(screenView: HomeView, viewModel: HomeViewModel) {
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
        navigationItem.hidesBackButton = true
        setup()
        configure()
    }
    
    // MARK: - setup
    private func setup() {
        setUpButton()
    }
    
    // MARK: - setUpButton
    private func setUpButton() {
        screenView.logOutButton.addTarget(self, action: #selector(didTappedLogOut), for: .touchUpInside)
    }
    
    // MARK: - didTappedLogOut
    @objc func didTappedLogOut() {
        homeCoordinator?.logOut()
    }
    
    // MARK: - configure
    private func configure() {
        screenView.welcomeLabel.text = "Welcome, \(viewModel.username)"
    }
}
