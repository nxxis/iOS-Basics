//
//  NotificationController.swift
//  Tab-Page VC
//
//  Created by ebpearls on 22/05/2023.
//

import UIKit

class NotificationController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
         
    }
    
    private func setup() {
        generateChildren()
    }
    
    private func generateChildren() {
        view.backgroundColor = .red
        
    }
}
