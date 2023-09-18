//
//  FormCoordinator.swift
//  DelegateAndMVC
//
//  Created by ebpearls on 18/07/2023.
//


import UIKit

protocol FormDelegate: AnyObject {
    func personObtained(_ person: Person)
}

class FormCoordinator: ChildCoordinator {
    
    var parentCoordinator: ParentCoordinator?
    
    var navigationController: UINavigationController
    
    weak var formDelegate: FormDelegate?
    
    init(navigationController: UINavigationController, delegate: FormDelegate) {
        self.navigationController = navigationController
        self.formDelegate = delegate
    }
    
    func startChild() {
        let vm = FormViewModel(formDelegate: formDelegate)
        
        let vc = FormViewController(screenView: FormView(), viewModel: vm)
        vc.formCoordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
