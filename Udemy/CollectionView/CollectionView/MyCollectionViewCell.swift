//
//  MyCollectionViewCell.swift
//  CollectionView
//
//  Created by ebpearls on 19/05/2023.
//

import UIKit


class MyCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI
    lazy var collectionLabel: UILabel = {
        let collectionLabel = UILabel()
        collectionLabel.textColor = .blue
        collectionLabel.translatesAutoresizingMaskIntoConstraints = false
        return collectionLabel
    }()
    
    lazy var imageViewer: UIImageView = {
        let imageViewer = UIImageView()
        imageViewer.translatesAutoresizingMaskIntoConstraints = false
        return imageViewer
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [imageViewer, collectionLabel])
        stack.axis = .vertical
        stack.spacing = 2
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        getChildren()
    }
    
    func getChildren() {
        contentView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            imageViewer.heightAnchor.constraint(equalToConstant: 130),
            imageViewer.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
}
