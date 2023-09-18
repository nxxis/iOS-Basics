//
//  ProfileCollectionViewCell.swift
//  UrlTableView
//
//  Created by ebpearls on 15/06/2023.
//

import UIKit
import Kingfisher

class ProfileViewCell: UICollectionViewCell {
    
    // MARK: - properties
    
    // MARK: - UI
    lazy var imageView: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode = .scaleAspectFill
        imageview.clipsToBounds = true
        return imageview
    }()
    
    // MARK: - Cell LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - setup
    func setup(){
        generateChild()
    }
    
    // MARK: - configure
    func configure(image: String) {
        guard let url = URL(string: image) else {return}
        
        Utility.imageCaching(image: image) { [weak self] image in
            guard let self = self else {return}
            if let image = image {
                self.imageView.image = image
            } else {
                self.imageView.kf.indicatorType = .activity
                self.imageView.kf.setImage(with: url, options: [.transition(.fade(0.7))])
            }
        }
    }
    
    // MARK: - generateChild
    private func generateChild() {
        contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
