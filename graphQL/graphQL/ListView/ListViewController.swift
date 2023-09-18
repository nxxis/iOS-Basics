//
//  ListViewController.swift
//  GraphQLImplementation
//
//  Created by ebpearls on 05/07/2023.
//

import UIKit

class ListViewController: UIViewController {
    // MARK: - properties
    
    private var viewModel: ListViewModel
    private var screenView: ListView
    
    init(viewModel: ListViewModel, screenView: ListView) {
        self.viewModel = viewModel
        self.screenView = screenView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -  vcLifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view = screenView
        viewModel.getUsers()
        observeEvents()
        setup()
        viewModel.performMutation()
    }
    
    private func observeEvents() {
        viewModel.obtainedData = { [weak self] in
            guard let self = self else { return }
            self.reloadTable()
        }
    }
    
    private func reloadTable() {
        screenView.tableView.reloadData()
    }
    
    private func setup() {
        setupNavBar()
        setupTableView()
    }
    
    private func setupNavBar() {
        navigationItem.title = "User"
    }
    
    private func setupTableView() {
        screenView.tableView.dataSource = self
        screenView.tableView.delegate = self
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ListViewCell = tableView.dequeueCell(forIndexPath: indexPath)
        
        if let users = viewModel.users {
            cell.configure(user: users)
        }
        
        return cell
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

