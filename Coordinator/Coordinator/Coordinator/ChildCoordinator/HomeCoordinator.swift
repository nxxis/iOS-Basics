//
//  HomeCoordinator.swift
//  Coordinator
//
//  Created by ebpearls on 12/07/2023.
//

import UIKit

class HomeCoordinator: ChildCoordinator {
    
    // MARK: - properties
    weak var parentCoordinator: ParentCoordinator?
    
    var navigationController: UINavigationController
    
    var username: String?
    
    // MARK: - initilization
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - startChild
    func startChild() {
        
        let vc = HomeViewController(screenView: HomeView(), viewModel: HomeViewModel(username: username ?? ""))
        
        vc.homeCoordinator = self
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    // MARK: - passParameter
    func passParameter(value: Decodable) {
        guard let parameter = value as? HomeParameter else { return }
        self.username = parameter.username
    }
    
    // MARK: - logOut
    func logOut() {
        parentCoordinator?.removeChildCoordinator(child: self)
        navigationController.popToRootViewController(animated: true)
    }
}
