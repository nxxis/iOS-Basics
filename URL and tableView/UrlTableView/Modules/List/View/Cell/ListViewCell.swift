//
//  ListViewCell.swift
//  DelegateAndMVC
//
//  Created by ebpearls on 31/05/2023.
//

import UIKit

class ListViewCell: UITableViewCell {
    
    var imageCache = NSCache<AnyObject, UIImage>()
    
    // MARK: - UI
    private lazy var userIdLabel: UILabel = {
        let label = UILabel()
        label.text = "id:"
        label.textColor = .black
        label.setContentHuggingPriority(.defaultHigh+35, for: .horizontal)
        return label
    }()
    
    lazy var fetchedUserIdLabel: UILabel = {
        let passedValue = UILabel()
        passedValue.textColor = .black
        passedValue.numberOfLines = 0
        return passedValue
    }()
    
    private lazy var userIdStackView: UIStackView = {
        let hStack = UIStackView(arrangedSubviews: [userIdLabel, fetchedUserIdLabel])
        hStack.axis = .horizontal
        hStack.spacing = 1
        hStack.alignment = .fill
        hStack.distribution = .fill
        hStack.translatesAutoresizingMaskIntoConstraints = false
        return hStack
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "title:"
        label.textColor = .black
        label.setContentHuggingPriority(.defaultHigh+35, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var fetchedNameLabel: UILabel = {
        let passedValue = UILabel()
        passedValue.textColor = .black
        passedValue.numberOfLines = 0
        return passedValue
    }()
    
    ///addressLabel and Field Stack
    private lazy var idStackView: UIStackView = {
        let hStack = UIStackView(arrangedSubviews: [nameLabel, fetchedNameLabel])
        hStack.axis = .horizontal
        hStack.spacing = 1
        hStack.alignment = .fill
        hStack.distribution = .fill
        return hStack
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "description:"
        label.textColor = .black
        label.setContentHuggingPriority(.defaultHigh+35, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var fetchedEmailLabel: UILabel = {
        let passedValue = UILabel()
        passedValue.textColor = .black
        passedValue.numberOfLines = 0
        return passedValue
    }()
    
    ///addressLabel and Field Stack
    private lazy var emailStackView: UIStackView = {
        let hStack = UIStackView(arrangedSubviews: [emailLabel, fetchedEmailLabel])
        hStack.axis = .horizontal
        hStack.spacing = 1
        hStack.alignment = .fill
        hStack.distribution = .fill
        return hStack
    }()
    
    private lazy var genderLabel: UILabel = {
        let label = UILabel()
        label.text = "price:"
        label.textColor = .black
        label.setContentHuggingPriority(.defaultHigh+35, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var fetchedgenderLabel: UILabel = {
        let passedValue = UILabel()
        passedValue.textColor = .black
        return passedValue
    }()
    
    ///phoneLabel and FieldStack
    private lazy var genderStackView: UIStackView = {
        let vStack = UIStackView(arrangedSubviews: [genderLabel, fetchedgenderLabel])
        vStack.axis = .horizontal
        vStack.spacing = 1
        vStack.alignment = .fill
        vStack.distribution = .fill
        return vStack
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "status:"
        label.textColor = .black
        label.setContentHuggingPriority(.defaultHigh+35, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var fetchedStatusLabel: UILabel = {
        let passedValue = UILabel()
        passedValue.textColor = .black
        return passedValue
    }()
    
    ///phoneLabel and FieldStack
    private lazy var statusStackView: UIStackView = {
        let vStack = UIStackView(arrangedSubviews: [genderLabel, fetchedgenderLabel])
        vStack.axis = .horizontal
        vStack.spacing = 1
        vStack.alignment = .fill
        vStack.distribution = .fill
        return vStack
    }()
    
    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    ///main stack
    private lazy var titleStack: UIStackView = {
        let vMainStack = UIStackView(arrangedSubviews: [userIdStackView, idStackView, emailStackView, genderStackView, statusStackView])
        vMainStack.axis = .vertical
        vMainStack.spacing = 10
        vMainStack.distribution = .fill
        vMainStack.alignment = .top
        vMainStack.translatesAutoresizingMaskIntoConstraints = false
        return vMainStack
    }()
    
    private lazy var mainStack: UIStackView = {
        let hStack = UIStackView(arrangedSubviews: [productImageView,titleStack])
        hStack.axis = .horizontal
        hStack.spacing = 10
        hStack.distribution = .fill
        hStack.alignment = .top
        hStack.translatesAutoresizingMaskIntoConstraints = false
        return hStack
    }()
    
    // MARK: - Cell Life Cycle
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
        contentView.addSubview(mainStack)
        
        NSLayoutConstraint.activate([
            
            mainStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            mainStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            mainStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            mainStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            
            productImageView.heightAnchor.constraint(equalToConstant: 130),
            productImageView.widthAnchor.constraint(equalToConstant: 130),
            
        ])
        
        [userIdLabel, nameLabel, emailLabel, genderLabel, statusLabel].forEach {
            $0.widthAnchor.constraint(equalToConstant: 100).isActive = true
        }
    }
    
    // MARK: - configure
    func configure(product: Products) {
        fetchedUserIdLabel.text = "\(product.id)"
        fetchedNameLabel.text = product.title
        fetchedEmailLabel.text = product.descriptions
        fetchedgenderLabel.text = "\(product.price)"
        
        guard let url = URL(string: product.thumbnail ?? "") else {return}
        
        Utility.imageCaching(image: product.thumbnail ?? "") { [weak self] image in
            guard let self = self else {return}
            if let image = image {
                self.productImageView.image = image
            } else {
                self.productImageView.kf.indicatorType = .activity
                self.productImageView.kf.setImage(with: url, options: [.transition(.fade(0.7))])
            }
        }
    }
}
