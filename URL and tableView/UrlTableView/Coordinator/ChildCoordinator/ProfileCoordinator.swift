//
//  ProfileCoordinator.swift
//  UrlTableView
//
//  Created by ebpearls on 17/07/2023.
//

import UIKit

class ProfileCoordinator: ChildCoordinator {
    
    // MARK: - Properties
    weak var parentCoordinator: ParentCoordinator?
    
    var navigationController: UINavigationController
    
    var id: Int
    
    // MARK: - initilization
    init(navigationController: UINavigationController, id: Int) {
        self.navigationController = navigationController
        self.id = id
    }
    
    // MARK: - startChild
    func startChild() {
        let vm = ProfileViewModel(httpUtility: HttpUtility(), id: id)
        let vc = ProfileViewController(screenView: ProfileView(), viewModel: vm)
        vc.profileCoordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
