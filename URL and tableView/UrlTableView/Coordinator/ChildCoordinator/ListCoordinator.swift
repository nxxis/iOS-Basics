//
//  ListCoordinator.swift
//  UrlTableView
//
//  Created by ebpearls on 17/07/2023.
//

import UIKit

class ListCoordinator: ChildCoordinator {
    
    // MARK: - Properties
    weak var parentCoordinator: ParentCoordinator?
    
    var navigationController: UINavigationController
    
    // MARK: - initilization
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - startChild
    func startChild() {
        let vm = ListViewModel(httpUtility: HttpUtility())
        let vc = ListViewController(screenView: ListView(), viewModel: vm)
        vc.listCoordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    // MARK: - navigateToProfile
    func navigateToProfile(id: Int) {
        let profileCoordinator = ProfileCoordinator(navigationController: navigationController, id: id)
        parentCoordinator?.childCoordinators.append(profileCoordinator)
        profileCoordinator.parentCoordinator = parentCoordinator
        profileCoordinator.startChild()
    }
    
    // MARK: - navigateToForm
    func navigateToForm() {
        let formCoordinator = FormCoordinator(navigationController: navigationController)
        parentCoordinator?.childCoordinators.append(formCoordinator)
        formCoordinator.parentCoordinator = parentCoordinator
        formCoordinator.startChild()
    }
}
