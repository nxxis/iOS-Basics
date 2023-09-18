//
//  CustomTableViewCell.swift
//  CollectionView
//
//  Created by ebpearls on 19/05/2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    lazy var imageViewer: UIImageView = {
        let imageView = UIImageView()
        //imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var imageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageViewer, imageLabel])
        stackView.axis = .horizontal
        stackView.spacing = 3
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setup
    private func setup() {
        generateChild()
    }
    
    // MARK: - generateChild
    private func generateChild() {
        
        contentView.addSubview(stackView)
        NSLayoutConstraint.activate([
            imageViewer.heightAnchor.constraint(equalToConstant: 150),
            imageViewer.widthAnchor.constraint(equalToConstant: 150),
            
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}

