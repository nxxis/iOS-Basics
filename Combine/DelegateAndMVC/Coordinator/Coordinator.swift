//
//  Coordinator.swift
//  DelegateAndMVC
//
//  Created by ebpearls on 18/07/2023.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
}

protocol ParentCoordinator: Coordinator {
    var childCoordinators: [ChildCoordinator] { get set }
    func start()
    func removeChildCoordinator(child: ChildCoordinator)
}

protocol ChildCoordinator: Coordinator {
    var parentCoordinator: ParentCoordinator? { get set }
    func startChild()
}
