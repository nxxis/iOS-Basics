//
//  ListViewController.swift
//  DelegateAndMVC
//
//  Created by ebpearls on 31/05/2023.
//

import UIKit
import Combine

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
        setup()
    }
    
    private func setup() {
        setupNavbar()
        setupTableView()
        setupSearchBar()
        observer()
    }
    
    // MARK: - checkEmpty
    func observer() {
        viewModel.checkEmpty = { [weak self] in
            guard let self = self else { return }
            if self.viewModel.filteredData.isEmpty {
                self.screenView.emptyLabel.isHidden = false
            } else {
                self.screenView.emptyLabel.isHidden = true
            }
            self.screenView.tableView.reloadData()
        }
    }
    
    // MARK: - setupTableView
    private func setupTableView() {
        screenView.tableView.delegate = self
        screenView.tableView.dataSource = self
    }
    
    // MARK: - setupSearchBar
    private func setupSearchBar(){
        screenView.searchBar.delegate = self
    }
    
    // MARK: - setupNavbar
    private func setupNavbar () {
        navigationItem.title = "Person List"
        navigationItem.rightBarButtonItem = screenView.addButton
        screenView.addButton.target = self
        screenView.addButton.action = #selector(addTapped)
    }
    
    // MARK: - addTapped
    @objc private func addTapped() {
        listCoordinator?.navigateToForm(delegate: viewModel)
    }
}
// MARK: - UITableViewDataSource
extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ListViewCell = tableView.dequeueCell(forIndexPath: indexPath)
        cell.configure(person: viewModel.filteredData[indexPath.item])
        
        cell.didTappedfavButton = { [weak self] id in
            guard let self = self else { return }
            if let indexValue = self.viewModel.personList.firstIndex(where: {$0.id == id }) {
                self.viewModel.personList[indexValue].isFav.toggle()
            }
            
            self.viewModel.filteredData = self.viewModel.searchText.isEmpty ? self.viewModel.personList : self.viewModel.personList.filter { person in
                return person.name.range(of: self.viewModel.searchText, options: .caseInsensitive) != nil
            }
        }
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        listCoordinator?.navigateToProfile(person: viewModel.personList[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let searchBar = screenView.searchBar
        return searchBar
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
}

// MARK: - UISearchBarDelegate
extension ListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.search(searchText: searchText)
    }
}

