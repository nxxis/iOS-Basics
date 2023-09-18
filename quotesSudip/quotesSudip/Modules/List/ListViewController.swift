//
//  ViewController.swift
//  quotesSudip
//
//  Created by ebpearls on 30/06/2023.
//

import UIKit

class ListViewController: UIViewController {
    
    // MARK: - Properties
    private let screenView: ListView
    
    private let viewModel: ListViewModel
    
    weak var coordinator: MainCoordinator?
    
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
        viewModel.getQuotes()
    }
    
    // MARK: - setup
    private func setup() {
        setupNavbar()
        setupTableView()
        observeEvents()
    }
    
    // MARK: - observeEvents
    private func observeEvents() {
        viewModel.dataObtained = { [weak self] in
            guard let self = self else { return }
            self.reloadTable()
            self.screenView.tableView.refreshControl?.endRefreshing()
        }
        
        viewModel.randomQuoteObtained = { [weak self] in
            guard let self = self,
                  let randomQuote = self.viewModel.randomQuotes
            else { return }
            DispatchQueue.main.async {
                self.setupAlert(title: randomQuote.author, message: randomQuote.quote)
            }
        }
        
        viewModel.errorObtained = { [weak self] in
            guard let self = self,
                  let errorMsg = self.viewModel.errorMessage
            else { return }
            DispatchQueue.main.async {
                self.setupAlert(title: "Error", message: errorMsg)
            }
        }
        
        viewModel.indicatorStart = { [weak self] flagValue in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if !flagValue{
                    self.screenView.indicator.startAnimating()
                    self.screenView.isUserInteractionEnabled = false
                }
            }
        }
        
        viewModel.indicatorStop = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.screenView.indicator.stopAnimating()
                self.screenView.isUserInteractionEnabled = true
            }
        }
        
        viewModel.alert = { [weak self] error in
            guard let self = self
            else { return }
            DispatchQueue.main.async {
                self.setupAlert(title: "Error Occurred", message: error)
            }
        }
        
        viewModel.refreshData = { [weak self] in
            guard let self = self
            else { return }
            self.screenView.tableView.refreshControl?.beginRefreshing()
            self.screenView.tableView.reloadData()
        }
    }
    
    // MARK: - reloadTable
    private func reloadTable() {
        DispatchQueue.main.async {
            self.screenView.tableView.reloadData()
        }
    }
    
    // MARK: - setupTableView
    private func setupTableView() {
        screenView.tableView.delegate = self
        screenView.tableView.dataSource = self
        
        screenView.tableView.showsVerticalScrollIndicator = false
        screenView.tableView.tableFooterView = self.screenView.indicator
        screenView.tableView.refreshControl?.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
    }
    
    // MARK: - didPullToRefresh
    @objc private func didPullToRefresh() {
        viewModel.getQuotes(refresh: true)
    }
    
    // MARK: - setupNavbar
    private func setupNavbar () {
        navigationItem.title = "Quote List"
        navigationItem.rightBarButtonItem = screenView.randomButton
        screenView.randomButton.target = self
        screenView.randomButton.action = #selector(randomTapped)
        
        navigationItem.leftBarButtonItem = screenView.errorButton
        screenView.errorButton.target = self
        screenView.errorButton.action = #selector(errorTapped)
    }
    
    // MARK: - setupAlert
    func setupAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okayAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okayAction)
        
        present(alert, animated: true)
    }
    
    // MARK: - randomTapped
    @objc private func randomTapped() {
        viewModel.getRandomQuote()
    }
    
    // MARK: - errorTapped
    @objc private func errorTapped() {
        viewModel.getError()
    }
}

// MARK: - UITableViewDataSource
extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.quotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let selectedQuote = viewModel.quotes[indexPath.row]
        
        let cell: ListViewCell = tableView.dequeueCell(forIndexPath: indexPath)
        
        cell.configure(quote: selectedQuote)
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedQuote = viewModel.quotes[indexPath.row]
        
        coordinator?.detailViewController(id: selectedQuote.id)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let quote = viewModel.quotes[indexPath.row]
        
        viewModel.checkForPagination(quote: quote)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}



