//
//  ListViewCoordinator.swift
//  quotesSudip
//
//  Created by ebpearls on 11/07/2023.
//

import Foundation
import UIKit

class DetailViewCoordinator: Coordinator {
    
    // MARK: - properties
    ///    var childCoordinators = [Coordinator]()
    var childCoordinators: [Coordinator] = []
    
    weak var parentCoordinator: MainCoordinator?
    
    var navigationController: UINavigationController
    
    // MARK: - initilization
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - start
    func start() {
        
        guard let id = parentCoordinator?.id else { return }
        
        let vm = DetailViewModel(id: id, networkUtility: HttpUtility())
        
        let vc = DetailViewController(screenView: ProfileView(), viewModel: vm)
        
        vc.coordinator = self
        
        navigationController.pushViewController(vc, animated: true)
    }
}
