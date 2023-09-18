//
//  MainCoordinator.swift
//  Coordinator
//
//  Created by ebpearls on 12/07/2023.
//

import UIKit

class MainCoordinator: ParentCoordinator {
    
    // MARK: - properties
    var childCoordinators: [ChildCoordinator] = []
    ///    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    // MARK: - initilization
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - start
    func start() {
        
        let authenticationCoordinator = ChildCoordinatorFactory.create(navigationController: navigationController, type: .authentication)
        
        childCoordinators.append(authenticationCoordinator)
        
        authenticationCoordinator.parentCoordinator = self
        
        authenticationCoordinator.startChild()
    }
    
    // MARK: - removeChildCoordinator
    func removeChildCoordinator(child: ChildCoordinator) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if (coordinator === child) {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}
