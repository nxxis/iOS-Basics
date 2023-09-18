//
//  ListView.swift
//  DelegateAndMVC
//
//  Created by ebpearls on 31/05/2023.
//

import UIKit

class ListView: UIView {
    
    // MARK: - UI
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.registerCell(ListViewCell.self)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var searchBar: UISearchBar =  {
        let sBar = UISearchBar()
        sBar.placeholder = "Search Name"
        sBar.searchBarStyle = UISearchBar.Style.default
        sBar.sizeToFit()
        sBar.isTranslucent = false
        return sBar
    }()
    
    
    lazy var emptyLabel: UILabel = {
        let label = UILabel()
        label.text = "No Data Available"
        label.textColor = .black
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var addButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = UIImage(systemName: "person.badge.plus")
        return button
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
        addSubview(searchBar)
        addSubview(emptyLabel)
        
        tableView.rowHeight = UITableView.automaticDimension
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            emptyLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            emptyLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
