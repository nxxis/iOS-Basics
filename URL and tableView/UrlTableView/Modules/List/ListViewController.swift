//
//  ListViewController.swift
//  DelegateAndMVC
//
//  Created by ebpearls on 31/05/2023.
//

import UIKit
import CoreData

class ListViewController: UIViewController {
    
    // MARK: - Properties
    private let screenView: ListView
    private let viewModel: ListViewModel
    
    var listCoordinator: ListCoordinator?
    
    // MARK: - Initilization
    init(screenView: ListView, viewModel: ListViewModel) {
        self.screenView = screenView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - VC Lifecycle
    override func loadView() {
        super.loadView()
        view = screenView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenView.emptyLabel.isHidden = false
        setup()
    }
    
    // MARK: - setup
    private func setup() {
        setupNavbar()
        setupTableView()
        setupSearchBar()
        observeEvents()
        viewModel.getData()
        viewModel.fetchCoreData()
    }
    
    private func observeEvents() {
        viewModel.reloadTable = { [weak self] in
            guard let self = self else {return}
            self.reloadTable()
        }
    }
    
    // MARK: - reloadTable
    private func reloadTable() {
        checkEmpty()
        DispatchQueue.main.async {
            self.screenView.tableView.reloadData()
        }
    }
    
    // MARK: - setupTableView
    private func setupTableView() {
        screenView.tableView.delegate = self
        screenView.tableView.dataSource = self
        
        screenView.tableView.showsVerticalScrollIndicator = false
    }
    
    // MARK: - setupSearchBar
    private func setupSearchBar(){
        screenView.searchBar.delegate = self
    }
    
    // MARK: - setupNavbar
    private func setupNavbar () {
        navigationItem.title = "Product List"
        navigationItem.rightBarButtonItem = screenView.addButton
        
        screenView.addButton.target = self
        screenView.addButton.action = #selector(addTapped)
    }
    
    // MARK: - checkEmpty
    func checkEmpty() {
        DispatchQueue.main.async {
            self.screenView.emptyLabel.isHidden = !self.viewModel.filteredData.isEmpty
        }
    }
    
    // MARK: - addTapped
    @objc private func addTapped() {
        listCoordinator?.navigateToForm()
    }
}

// MARK: - UITableViewDataSource
extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let selectedProduct = viewModel.filteredData[indexPath.row]
        
        let cell: ListViewCell = tableView.dequeueCell(forIndexPath: indexPath)
        cell.configure(product: selectedProduct)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        listCoordinator?.navigateToProfile(id: Int(viewModel.coreDataArr[indexPath.row].id))
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let searchBar = screenView.searchBar
        return searchBar
    }
}

// MARK: - UISearchBarDelegate
extension ListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.doSearch(searchText: searchText)
    }
}

