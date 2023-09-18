//
//  ListViewCell.swift
//  DelegateAndMVC
//
//  Created by ebpearls on 31/05/2023.
//

import UIKit

protocol ListViewCellDelegate: NSObject {
    func didTapFavoriteButton(id: String)
}

class ListViewCell: UITableViewCell {
    
    //    var id: String?
    //    var index: Int?
    private var person: Person?
    weak var delegate: ListViewCellDelegate?
    
    // MARK: - UI
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Full Name:"
        label.textColor = .black
        label.setContentHuggingPriority(.defaultHigh+35, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var passedNameLabel: UILabel = {
        let passedValue = UILabel()
        passedValue.textColor = .black
        passedValue.numberOfLines = 0
        passedValue.setContentHuggingPriority(.defaultHigh+35, for: .vertical)
        return passedValue
    }()
    
    ///nameLabel and FieldStack
    private lazy var nameStack: UIStackView = {
        let hStack = UIStackView(arrangedSubviews: [nameLabel, passedNameLabel])
        hStack.axis = .horizontal
        hStack.spacing = 4
        hStack.alignment = .fill
        hStack.distribution = .fill
        hStack.setContentHuggingPriority(.defaultHigh+35, for: .vertical)
        return hStack
    }()
    
    private lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Address:"
        label.textColor = .black
        label.setContentHuggingPriority(.defaultHigh+35, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var passedAddressLabel: UILabel = {
        let passedValue = UILabel()
        passedValue.textColor = .black
        passedValue.numberOfLines = 0
        passedValue.setContentHuggingPriority(.defaultHigh+35, for: .vertical)
        return passedValue
    }()
    
    ///addressLabel and Field Stack
    private lazy var addressStack: UIStackView = {
        let hStack = UIStackView(arrangedSubviews: [addressLabel, passedAddressLabel])
        hStack.axis = .horizontal
        hStack.spacing = 4
        hStack.alignment = .fill
        hStack.distribution = .fill
        hStack.setContentHuggingPriority(.defaultHigh+34, for: .vertical)
        return hStack
    }()
    
    private lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "Phone Number:"
        label.textColor = .black
        label.setContentHuggingPriority(.defaultHigh+35, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var passedPhoneNumber: UILabel = {
        let passedValue = UILabel()
        passedValue.textColor = .black
        passedValue.setContentHuggingPriority(.defaultHigh+35, for: .vertical)
        return passedValue
    }()
    
    ///phoneLabel and FieldStack
    private lazy var phoneNumberStack: UIStackView = {
        let vStack = UIStackView(arrangedSubviews: [phoneLabel, passedPhoneNumber])
        vStack.axis = .horizontal
        vStack.spacing = 4
        vStack.alignment = .fill
        vStack.distribution = .fill
        vStack.setContentHuggingPriority(.defaultLow-15, for: .vertical)
        return vStack
    }()
    
    lazy var favButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(favButtonTapped), for: .touchUpInside)
        
        let selectedImage = UIImage(named: "HeartFilled")
        button.setImage(selectedImage, for: .selected )
        
        let defaultImage = UIImage(named: "Heart")
        button.setImage(defaultImage, for: .normal)
        
        button.setContentHuggingPriority(.defaultHigh+33, for: .horizontal)
        button.backgroundColor = .systemGray3
        return button
    }()
    
    ///main stack
    private lazy var detailStackView: UIStackView = {
        let vMainStack = UIStackView(arrangedSubviews: [nameStack, addressStack, phoneNumberStack])
        vMainStack.axis = .vertical
        vMainStack.spacing = 10
        vMainStack.distribution = .fill
        vMainStack.translatesAutoresizingMaskIntoConstraints = false
        return vMainStack
    }()
    
    private lazy var mainStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [detailStackView, favButton])
        view.axis = .horizontal
        view.spacing = 10
        view.distribution = .fill
        view.alignment = .top
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        contentView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
        ])
        
        [nameLabel, addressLabel, phoneLabel].forEach {
            $0.widthAnchor.constraint(equalToConstant: 150).isActive = true
        }
    }
    
    // MARK: - favButton
    @objc func favButtonTapped() {
        
        if let id = person?.id {
            delegate?.didTapFavoriteButton(id: id)
        }
    }
    
    // MARK: - configure
    func configure(person: Person){
        self.person = person
        passedNameLabel.text = person.name
        passedAddressLabel.text = person.address
        passedPhoneNumber.text = "\(person.phone)"
        favButton.isSelected = person.isFav
    }
}
