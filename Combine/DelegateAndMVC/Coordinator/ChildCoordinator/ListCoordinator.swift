//
//  ListCoordinator.swift
//  DelegateAndMVC
//
//  Created by ebpearls on 18/07/2023.
//

import UIKit

class ListCoordinator: ChildCoordinator {
    var parentCoordinator: ParentCoordinator?
    var navigationController: UINavigationController
    
    var person: Person?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func startChild() {
        let vm = ListViewModel()
        let vc = ListViewController(screenView: ListView(), viewModel: vm)
        vc.listCoordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func navigateToForm(delegate: FormDelegate) {
        let formCoordinator = FormCoordinator(navigationController: navigationController, delegate: delegate)
        parentCoordinator?.childCoordinators.append(formCoordinator)
        formCoordinator.parentCoordinator = parentCoordinator
        formCoordinator.startChild()
    }
    
    func navigateToProfile(person: Person) {
        self.person = person
        let profileCoordinator = ProfileCoordinator(navigationController: navigationController)
        parentCoordinator?.childCoordinators.append(profileCoordinator)
        profileCoordinator.parentCoordinator = parentCoordinator
        profileCoordinator.passData(person: person)
        profileCoordinator.startChild()
    }
}
