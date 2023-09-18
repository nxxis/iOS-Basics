//
//  ListTableViewCell.swift
//  GraphQLImplementation
//
//  Created by ebpearls on 05/07/2023.
//

import UIKit

class ListViewCell: UITableViewCell {
    
    // MARK: -  UIs
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.setContentHuggingPriority(.defaultHigh+20, for: .vertical)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentHuggingPriority(.defaultLow+20, for: .vertical)
        return label
    }()
    
    lazy var mainStackView: UIStackView = {
        let view  = UIStackView(arrangedSubviews: [nameLabel, descriptionLabel])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 10
        return view
    }()
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setup
    private func setup(){
        generateChild()
    }
    
    // MARK: - generateChild
    private func generateChild(){
        contentView.addSubview(mainStackView)
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }
    
    
    // MARK: - configure
    func configure(user: User){
        self.nameLabel.text = user.id
        self.descriptionLabel.text = user.email
    }
}
