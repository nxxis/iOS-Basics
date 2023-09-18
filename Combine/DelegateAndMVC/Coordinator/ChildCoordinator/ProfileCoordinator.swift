//
//  ProfileCoordinator.swift
//  DelegateAndMVC
//
//  Created by ebpearls on 18/07/2023.
//

import UIKit

class ProfileCoordinator: ChildCoordinator {
    
    var parentCoordinator: ParentCoordinator?
    
    var navigationController: UINavigationController
    
    var person: Person?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func startChild() {
        guard let person = person else { return }
        let vm = ProfileViewModel(personData: person)
        
        let vc = ProfileViewController(screenView: ProfileView(), viewModel: vm)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func passData(person: Person) {
        self.person = person
    }
}

