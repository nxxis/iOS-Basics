//
//  LandingPageVC.swift
//  Tab-Page VC
//
//  Created by ebpearls on 22/05/2023.
//

import UIKit

class LandingPageVC: UIViewController {
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .lightGray
        button.setTitle("Click", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var button2: UIButton = {
        let button = UIButton()
        button.backgroundColor = .lightGray
        button.setTitle("PageVc", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped2), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        
    }
    
    private func setup() {
        generateChildren()
    }
    
    private func generateChildren() {
        view.addSubview(button)
        view.addSubview(button2)
        view.backgroundColor = .gray
        
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            button2.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20),
            button2.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    @objc func buttonTapped() {
        navigationController?.pushViewController(TabController(), animated: true)
    }
    
    @objc func buttonTapped2() {
        navigationController?.pushViewController(PageVC(), animated: true)
    }
    
}
