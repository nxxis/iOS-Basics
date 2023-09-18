//
//  AuthenticationCoordinator.swift
//  Coordinator
//
//  Created by ebpearls on 12/07/2023.
//

import UIKit

class AuthenticationCoordinator: ChildCoordinator {
    
    // MARK: - properties
    weak var parentCoordinator: ParentCoordinator?
    
    var navigationController: UINavigationController
    
    // MARK: - initilization
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - startChild
    func startChild() {
        let vm = LoginViewModel()
        
        let vc = LoginViewController(screenView: LoginView(), viewModel: vm)
        
        vc.authenticatonCoordinator = self
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    // MARK: - navigateToSignUp
    func navigateToSignUp() {
        
        let vc = SignUpViewController(screenView: SignUpView(), viewModel: SignUpViewModel())
        
        vc.authenticationCoordinator = self
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    // MARK: - navigateToforgetPassword
    func navigateToforgetPassword() {
        
        let vc = ForgetPasswordViewController(screenView: ForgetPasswordView(), viewModel: ForgetPasswordViewModel())
        
        vc.authenticationCoordinator = self
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    // MARK: - navigateTohome
    func navigateTohome(username: String) {

        let homeCoordinator = ChildCoordinatorFactory.create(navigationController: navigationController, type: .home)
        
        homeCoordinator.passParameter(value: HomeParameter(username: username))
        
        parentCoordinator?.childCoordinators.append(homeCoordinator)
        
        homeCoordinator.parentCoordinator = parentCoordinator
        
        homeCoordinator.startChild()
    }
}
