//
//  PersonDataTableView.swift
//  DataParsingToViewTable
//
//  Created by ebpearls on 29/05/2023.
//

import UIKit

class ListView: UIView {
    
    // MARK: - UI
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ListCellView.self, forCellReuseIdentifier: "PersonDataTableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - View Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setup() {
        generateChild()
    }
    
    private func generateChild() {
        addSubview(tableView)
        tableView.rowHeight = UITableView.automaticDimension
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
