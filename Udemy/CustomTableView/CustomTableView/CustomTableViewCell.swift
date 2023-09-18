//
//  CustomTableViewCell.swift
//  CustomTableView
//
//  Created by ebpearls on 18/05/2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    
    private lazy var imageHolder: UIImageView = {
        let imageViewer = UIImageView()
        imageViewer.translatesAutoresizingMaskIntoConstraints = false
        return imageViewer
    }()
    
    private lazy var imageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var typeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Click", for: .normal)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        generateChild()
    }
    
    
    // MARK: - generateChild
    private func generateChild() {
        contentView.addSubview(imageHolder)
        contentView.addSubview(imageLabel)
        contentView.addSubview(typeButton)
        
        NSLayoutConstraint.activate([
            imageHolder.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageHolder.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageHolder.heightAnchor.constraint(equalToConstant: 100),
            imageHolder.widthAnchor.constraint(equalToConstant: 100),
            
            imageLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            typeButton.trailingAnchor.constraint(equalTo: imageLabel.trailingAnchor, constant: -20),
//            typeButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            typeButton.widthAnchor.constraint(equalToConstant: 60),
//            typeButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    
    func configureCell(with imageName: String) {
        imageHolder.image = UIImage(named: imageName)
        imageLabel.text = " Image name is" + " " + "\(imageName)"
    }
    
}

