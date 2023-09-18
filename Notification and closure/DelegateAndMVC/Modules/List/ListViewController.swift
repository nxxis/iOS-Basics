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
    
    private let formViewModel = FormViewModel()
    
    private var cancellables = Set<AnyCancellable>()
    
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
        observeEvents()
        viewModel.configureNotification()
    }
    
    // MARK: - observeEvents
    private func observeEvents() {
        viewModel.reloadTable = { [weak self] in
            guard let self = self else {return}
            self.reloadTable()
        }
        
        formViewModel.personSubject.sink { person in
            print(person)
        }.store(in: &cancellables)
    }
    
    // MARK: - checkEmpty
    func checkEmpty() {
        DispatchQueue.main.async {
            self.screenView.emptyLabel.isHidden = !self.viewModel.filteredData.isEmpty
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
        let vc = FormViewController(view: FormView(), viewModel: formViewModel)
        navigationController?.pushViewController(vc, animated: true)
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
        cell.closureDelegate = { [weak self] id in
            guard let self = self else {return}
            self.viewModel.didTapFavoriteButton(id: id)}
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vm = ProfileViewModel(personData: viewModel.personList[indexPath.row])
        let vc = ProfileViewController(screemView: ProfileView(), viewModel: vm)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let searchBar = screenView.searchBar
        return searchBar
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - UISearchBarDelegate
extension ListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.doSearch(searchText: searchText)
    }
}

