//
//  ProfileVC.swift
//  quotesSudip
//
//  Created by ebpearls on 30/06/2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    private let screenView: ProfileView
    
    private let viewModel: DetailViewModel
    
    weak var coordinator: DetailViewCoordinator?
    
    // MARK: - Initilization
    init(screenView: ProfileView, viewModel: DetailViewModel) {
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
        viewModel.getData()
        observeEvents()
    }
    
    // MARK: - navSetup()
    private func navSetup() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            self.navigationItem.title = "Details"
        }
    }
    
    // MARK: - observeEvents
    private func observeEvents() {
        viewModel.quoteObtained = { [weak self] in
            guard let self = self else { return }
            self.configuration()
            self.navSetup()
        }
    }
    
    // MARK: - configure()
    private func configuration() {
        guard let quote = viewModel.quote else {return}
        screenView.configure(quote: quote)
    }
}

