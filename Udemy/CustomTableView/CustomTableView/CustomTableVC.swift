//
//  CustomTableVC.swift
//  CustomTableView
//
//  Created by ebpearls on 18/05/2023.
//

import UIKit

class CustomTableVC: UITableViewController {
    
    private lazy var imageHolder: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    private func setup() {
        generateChild()
    }
    
    private func generateChild() {
        contentView.addSubview(profileImageView)
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            profileImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            profileImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: 100),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
        ])
    }

    // MARK: - Table view data source

    

  
    // MARK: - Navigation

   

}
