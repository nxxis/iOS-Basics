//
//  Coordinator.swift
//  quotesSudip
//
//  Created by ebpearls on 11/07/2023.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
}
