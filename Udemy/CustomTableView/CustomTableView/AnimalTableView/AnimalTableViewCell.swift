//
//  TableViewCell.swift
//  CustomTableView
//
//  Created by ebpearls on 19/05/2023.
//

import UIKit

class AnimalTableViewCell: UITableViewCell {
    
    struct Animal {
        var name: String
        var image: UIImage
    }
    
    // MARK: - UI
    private lazy var imageHolder: UIImageView = {
        let imageViewer = UIImageView()
        imageViewer.layer.cornerRadius = imageViewer.frame.height / 2
        imageViewer.clipsToBounds = true
        imageViewer.translatesAutoresizingMaskIntoConstraints = false
        return imageViewer
    }()
    
    private lazy var imageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        
        
        NSLayoutConstraint.activate([
            imageHolder.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageHolder.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageHolder.heightAnchor.constraint(equalToConstant: 100),
            imageHolder.widthAnchor.constraint(equalToConstant: 100),
            
            imageLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
        
        
        }
    func configureCell(with imageName: String) {
        imageHolder.image = UIImage(named: imageName)
        imageLabel.text = " Image name is" + " " + "\(imageName)"
    }

}
