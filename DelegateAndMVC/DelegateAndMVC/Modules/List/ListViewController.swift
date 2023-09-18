//
//  ListViewController.swift
//  DelegateAndMVC
//
//  Created by ebpearls on 31/05/2023.
//

import UIKit

class ListViewController: UIViewController {
    
    // MARK: - Properties
    private let screenView: ListView
    var searchText: String = ""
    
    private var personList: [Person] = [] {
        didSet {
            filteredData = personList
        }
    }
    
    private var filteredData: [Person] = [] {
        didSet {
            checkEmpty()
            screenView.tableView.reloadData()
        }
    }
    
    // MARK: - Initilization
    init(screenView: ListView) {
        self.screenView = screenView
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
        checkEmpty()
    }
    
    // MARK: - checkEmpty
    func checkEmpty() {
        if filteredData.isEmpty {
            screenView.emptyLabel.isHidden = false
        } else {
            screenView.emptyLabel.isHidden = true
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
        let vc = FormViewController(with: FormView())
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}
// MARK: - UITableViewDataSource
extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ListViewCell = tableView.dequeueCell(forIndexPath: indexPath)
        cell.configure(person: filteredData[indexPath.item])
        cell.delegate = self
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ProfileViewController(personData: personList[indexPath.row], screemView: ProfileView())
        navigationController?.pushViewController(vc, animated: true)
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
        self.searchText = searchText
        filteredData = searchText.isEmpty ? personList : personList.filter { person in
            return person.name.range(of: searchText, options: .caseInsensitive) != nil
        }
    }
}

// MARK: - FormViewDelegate
extension ListViewController: FormViewDelegate {
    func addFormData(persons: Person) {
        personList.append(persons)
    }
}

// MARK: - ListViewCellDelegate
extension ListViewController: ListViewCellDelegate {
    func didTapFavoriteButton(id: String) {
        if let indexValue = personList.firstIndex(where: {$0.id == id }) {
            personList[indexValue].isFav.toggle()
        }
        
        filteredData = searchText.isEmpty ? personList : personList.filter { person in
            return person.name.range(of: searchText, options: .caseInsensitive) != nil
        }
    }
}
