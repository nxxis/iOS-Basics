//
//  ListView.swift
//  GraphQLImplementation
//
//  Created by ebpearls on 05/07/2023.
//

import UIKit

class ListView: UIView {
    
    // MARK: - UIs
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.register(cellClass: ListViewCell.self)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setup
    private func setup(){
        backgroundColor = .white
        generateChild()
    }
    
    // MARK: - generateChild
    private func generateChild(){
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
        ])
    }
}
