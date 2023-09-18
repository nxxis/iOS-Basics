//
//  BaseCoordinator.swift
//  quotesSudip
//
//  Created by ebpearls on 11/07/2023.
//

import Foundation
import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    
    // MARK: - properties
    ///    var childCoordinators = [Coordinator]()
    var childCoordinators: [Coordinator] = []
    
    var id: Int?
    
    var navigationController: UINavigationController
    
    // MARK: - initilization
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - start
    func start() {
        
        navigationController.delegate = self
        
        let vm = ListViewModel(httpUtility: HttpUtility())
        
        let vc = ListViewController(screenView: ListView(), viewModel: vm)
        
        vc.coordinator = self
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    // MARK: - detailViewController
    func detailViewController(id: Int) {
        
        self.id = id
        
        let child = DetailViewCoordinator(navigationController: navigationController)
        
        childCoordinators.append(child)
        
        child.parentCoordinator = self
        
        child.start()
    }
    
    // MARK: - childDidFinish
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    // MARK: - navigationController
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
        
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        if let detailViewController = fromViewController as? DetailViewController {
            childDidFinish(detailViewController.coordinator)
        }
    }
}
