//
//  ProfileViewController.swift
//  DelegateAndMVC
//
//  Created by ebpearls on 31/05/2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Properties
    private let screenView: ProfileView
    
    private let viewModel: ProfileViewModel
    
    var profileCoordinator: ProfileCoordinator?
    
    // MARK: - Initilization
    init(screenView: ProfileView, viewModel: ProfileViewModel) {
        self.screenView = screenView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Controlller Life Cycle
    override func loadView() {
        super.loadView()
        view = screenView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        navigationItem.title = "\(viewModel.personData.name)" + " " + "Detail's"
    }
    
    // MARK: - Configure Data
    private func configure() {
        
        screenView.passedNameLabel.text = viewModel.personData.name
        screenView.passedAddressLabel.text = viewModel.personData.address
        screenView.passedPhoneNumber.text = "\(viewModel.personData.phone)"
        screenView.bioValueLabel.text = viewModel.personData.bio
        
        if viewModel.personData.isFav == true {
            let selectedImage = UIImage(named: "HeartFilled")
            screenView.favButton.setImage(selectedImage, for: .normal)
        } else {
            let defaultImage = UIImage(named: "Heart")
            screenView.favButton.setImage(defaultImage, for: .normal)
        }
    }
}
