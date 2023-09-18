//
//  DisplayDataTableViewCell.swift
//  DataParsingToViewTable
//
//  Created by ebpearls on 26/05/2023.
//

import UIKit



class ListCellView: UITableViewCell {
    
    // MARK: - CellUI
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Full Name:"
        label.textColor = .black
        label.widthAnchor.constraint(equalToConstant: 130).isActive = true
        return label
    }()
    
    private lazy var namePassedDataLabel: UILabel = {
        let passedValue = UILabel()
        passedValue.textColor = .black
        passedValue.numberOfLines = 0
        return passedValue
    }()
    
    ///nameLabel and FieldStack
    private lazy var nameLabelAndFieldStack: UIStackView = {
        let hStack = UIStackView(arrangedSubviews: [nameLabel, namePassedDataLabel])
        hStack.axis = .horizontal
        hStack.spacing = 5
        hStack.alignment = .fill
        hStack.distribution = .fill
        return hStack
    }()
    
    private lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Address:"
        label.textColor = .black
        label.widthAnchor.constraint(equalToConstant: 130).isActive = true
        return label
    }()
    
    private lazy var addressPassedDataLabel: UILabel = {
        let passedValue = UILabel()
        passedValue.textColor = .black
        passedValue.numberOfLines = 0
        return passedValue
    }()
    
    ///addressLabel and Field Stack
    private lazy var addressLabelAndFieldStack: UIStackView = {
        let hStack = UIStackView(arrangedSubviews: [addressLabel, addressPassedDataLabel])
        hStack.axis = .horizontal
        hStack.spacing = 5
        hStack.alignment = .fill
        hStack.distribution = .fill
        return hStack
    }()
    
    private lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "Phone Number:"
        label.textColor = .black
        label.widthAnchor.constraint(equalToConstant: 130).isActive = true
        return label
    }()
    
    private lazy var phoneNumberPassedDataLabel: UILabel = {
        let passedValue = UILabel()
        passedValue.textColor = .black
        return passedValue
    }()
    
    ///phoneLabel and FieldStack
    private lazy var phoneLabelAndFieldStack: UIStackView = {
        let vStack = UIStackView(arrangedSubviews: [phoneLabel, phoneNumberPassedDataLabel])
        vStack.axis = .horizontal
        vStack.spacing = 5
        vStack.alignment = .fill
        vStack.distribution = .fill
        return vStack
    }()
    
    ///main stack
    private lazy var mainStack: UIStackView = {
        let vMainStack = UIStackView(arrangedSubviews: [nameLabelAndFieldStack, addressLabelAndFieldStack, phoneLabelAndFieldStack])
        vMainStack.axis = .vertical
        vMainStack.spacing = 10
        vMainStack.distribution = .fill
        vMainStack.translatesAutoresizingMaskIntoConstraints = false
        return vMainStack
    }()
    
    func configure(person: PersonData) {
        namePassedDataLabel.text = person.names
        addressPassedDataLabel.text = person.address
        phoneNumberPassedDataLabel.text = "\(person.phoneNumber)"
    }
    
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
        
        NSLayoutConstraint.activate([mainStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
                                     mainStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant:  20),
                                     mainStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                                     mainStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
                                    ])
    }
    
}
