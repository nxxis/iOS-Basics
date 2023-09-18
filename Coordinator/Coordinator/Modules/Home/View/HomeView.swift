//
//  HomeView.swift
//  Coordinator
//
//  Created by ebpearls on 12/07/2023.
//

import UIKit

class HomeView: UIView {
    
    // MARK: - UI
    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.setContentHuggingPriority(.defaultHigh+35, for: .horizontal)
        return label
    }()
    
    lazy var logOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log Out", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemMint
        button.layer.cornerRadius = 6
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - View Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setup
    private func setup() {
        generateChild()
    }
    
    // MARK: - generateChild
    private func generateChild() {
        addSubview(welcomeLabel)
        addSubview(logOutButton)
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            welcomeLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 15),
            welcomeLabel.widthAnchor.constraint(equalToConstant: 135),
            
            logOutButton.topAnchor.constraint(equalTo: welcomeLabel.topAnchor),
            logOutButton.leadingAnchor.constraint(equalTo: welcomeLabel.trailingAnchor, constant: 150),
            logOutButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15),
        ])
    }
}
