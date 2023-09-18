//
//  TableViewController.swift
//  CollectionView
//
//  Created by ebpearls on 19/05/2023.
//

import UIKit

class TableViewController: UIViewController {
    
    let persons: [Person] = [
        Person(name: "Sudip", address: "Chitwan", age: 23, image: UIImage(named: "tiger")!),
        Person(name: "Partha", address: "Hattiban", age: 23, image: UIImage(named: "lion")!),
        Person(name: "Pranjal", address: "Baneshwor", age: 23, image: UIImage(named: "zebra")!),
        Person(name: "Roshan", address: "Kupandole", age: 23, image: UIImage(named: "giraffe")!),
    ]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
       
    }
    
    private func setup(){
        generateChildren()
    }
    
    private func generateChildren(){
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

}

extension TableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        cell.imageViewer.image = persons[indexPath.item].image
        cell.imageLabel.text = persons[indexPath.item].name
        return cell
    }
}

extension TableViewController: UITableViewDelegate {
    
}
