//
//  MainCoordinator.swift
//  UrlTableView
//
//  Created by ebpearls on 17/07/2023.
//

import UIKit

class MainCoordinator: ParentCoordinator {
    
    // MARK: - properties
    var childCoordinators: [ChildCoordinator] = []
    
    var navigationController: UINavigationController
    
    // MARK: - initilization
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - start
    func start() {
        
        let listCoordinator = ListCoordinator(navigationController: navigationController)
        childCoordinators.append(listCoordinator)
        listCoordinator.parentCoordinator = self
        listCoordinator.startChild()
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
