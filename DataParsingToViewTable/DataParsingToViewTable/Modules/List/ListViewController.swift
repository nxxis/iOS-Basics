//
//  DisplayDataController.swift
//  DataParsingToViewTable
//
//  Created by ebpearls on 26/05/2023.
//

import UIKit
import CoreData

protocol ListViewDelegate: NSObject {
    func sendDataToFormVC(person: PersonData)
    func restateFormVC()
}

class ListViewController: UIViewController {
    private let screenView: ListView
    var delegate: ListViewDelegate?
    
    var personList: [PersonData] {
        didSet {
            screenView.tableView.reloadData()
        }
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // MARK: - Initilization
    init(screenView: ListView ,personList: [PersonData]) {
        self.screenView = screenView
        self.personList = personList
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: - View Controller Lifecycle
    override func loadView() {
        super.loadView()
        view = screenView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate?.restateFormVC()
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setUp
    private func setUp() {
        setupTableview()
    }
    
    // MARK: - setupTableview
    private func setupTableview() {
        screenView.tableView.delegate = self
        screenView.tableView.dataSource = self
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        personList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonDataTableViewCell", for: indexPath) as! ListCellView
        cell.configure(person: personList[indexPath.item])
        return cell
    }
}

extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPerson = personList[indexPath.row]
        delegate?.sendDataToFormVC(person: selectedPerson)
        navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let selectedPerson = personList[indexPath.row]
            context.delete(selectedPerson)
            personList.remove(at: indexPath.row)
            do {
                try context.save()
            } catch {
                print("error",error)
            }
        }
    }
}






