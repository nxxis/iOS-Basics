//
//  ChildCoordinatorFactory.swift
//  Coordinator
//
//  Created by ebpearls on 13/07/2023.
//

import UIKit

enum childCoordinatorType {
    case authentication
    case home
}

class ChildCoordinatorFactory {
    
    static func create(navigationController: UINavigationController, type: childCoordinatorType) -> ChildCoordinator {
        
        switch type {
        case .authentication:
            return AuthenticationCoordinator(navigationController: navigationController)
        case .home:
            return HomeCoordinator(navigationController: navigationController)
        }
    }
}
