//
//  ViewController.swift
//  UrlSession
//
//  Created by ebpearls on 12/06/2023.
//

import UIKit
import Combine

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    private let screenView: HomeView
    private let viewModel: HomeViewModel
    
    private let input = PassthroughSubject<User, Never>()
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Initilization
    init(screenView: HomeView, viewModel: HomeViewModel) {
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
        viewModel.handleUser()
        bind()
    }
    
    private func bind() {
        viewModel.output.sink { [weak self] user in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.screenView.fetchedUserIdLabel.text = "\(user.id)"
                self.screenView.fetchedIdLabel.text = user.name
                self.screenView.fetchedTitleLabel.text = user.email
                self.screenView.fetchedIsCompletedLabel.text = user.gender
            }
        }.store(in: &cancellables)
    }
}


