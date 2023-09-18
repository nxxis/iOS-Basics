//
//  ListView.swift
//  quotesSudip
//
//  Created by ebpearls on 30/06/2023.
//

import UIKit

class ListView: UIView {
    
    // MARK: - UI
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.registerCell(ListViewCell.self)
        tableView.refreshControl = UIRefreshControl()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var randomButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = UIImage(systemName: "quote.bubble")
        return button
    }()
    
    lazy var errorButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = UIImage(systemName: "exclamationmark.triangle.fill")
        return button
    }()
    
    var indicator: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView()
        loader.hidesWhenStopped = true
        loader.style = .medium
        loader.color = .blue
        loader.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 70)
        return loader
    }()
    
    // MARK: - View Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setup() {
        generateChild()
    }
    
    // MARK: - generateChild
    private func generateChild() {
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

