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
    
    private let personData: Person
    
    // MARK: - Initilization
    init(personData: Person, screemView: ProfileView) {
        self.personData = personData
        self.screenView = screemView
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
        navigationItem.title = "\(personData.name)" + " " + "Detail's"
    }
    
    // MARK: - Configure Data
    private func configure() {
        screenView.passedNameLabel.text = personData.name
        screenView.passedAddressLabel.text = personData.address
        screenView.passedPhoneNumber.text = "\(personData.phone)"
        screenView.bioValueLabel.text = personData.bio
        if personData.isFav == true {
            let selectedImage = UIImage(named: "HeartFilled")
            screenView.favButton.setImage(selectedImage, for: .normal)
        } else {
            let defaultImage = UIImage(named: "Heart")
            screenView.favButton.setImage(defaultImage, for: .normal)
        }
    }
}
