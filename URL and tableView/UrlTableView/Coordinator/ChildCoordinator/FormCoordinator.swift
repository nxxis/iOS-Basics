//
//  FormCoordinator.swift
//  UrlTableView
//
//  Created by ebpearls on 17/07/2023.
//

import UIKit

class FormCoordinator: ChildCoordinator {
    
    // MARK: - Properties
    weak var parentCoordinator: ParentCoordinator?
    
    var navigationController: UINavigationController
    
    // MARK: - initilization
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func startChild() {
        
        let vm = FormViewModel(httpUtility: HttpUtility())
        let vc = FormViewController(view: FormView(), viewModel: vm)
        vc.formCoordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
