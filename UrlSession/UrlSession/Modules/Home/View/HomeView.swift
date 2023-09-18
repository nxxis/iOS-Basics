//
//  HomeView.swift
//  UrlSession
//
//  Created by ebpearls on 12/06/2023.
//

import UIKit

class HomeView: UIView {
    
    // MARK: - UI
    private lazy var userIDLabel: UILabel = {
        let label = UILabel()
        label.text = "UserID:"
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
        let hStack = UIStackView(arrangedSubviews: [userIDLabel, fetchedUserIdLabel])
        hStack.axis = .horizontal
        hStack.spacing = 4
        hStack.alignment = .fill
        hStack.distribution = .fill
        hStack.translatesAutoresizingMaskIntoConstraints = false
        return hStack
    }()
    
    private lazy var idLabel: UILabel = {
        let label = UILabel()
        label.text = "id:"
        label.textColor = .black
        label.setContentHuggingPriority(.defaultHigh+35, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var fetchedIdLabel: UILabel = {
        let passedValue = UILabel()
        passedValue.textColor = .black
        passedValue.numberOfLines = 0
        return passedValue
    }()
    
    ///addressLabel and Field Stack
    private lazy var idStackView: UIStackView = {
        let hStack = UIStackView(arrangedSubviews: [idLabel, fetchedIdLabel])
        hStack.axis = .horizontal
        hStack.spacing = 4
        hStack.alignment = .fill
        hStack.distribution = .fill
        return hStack
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "title:"
        label.textColor = .black
        label.setContentHuggingPriority(.defaultHigh+35, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var fetchedTitleLabel: UILabel = {
        let passedValue = UILabel()
        passedValue.textColor = .black
        passedValue.numberOfLines = 0
        return passedValue
    }()
    
    ///addressLabel and Field Stack
    private lazy var titleStackView: UIStackView = {
        let hStack = UIStackView(arrangedSubviews: [titleLabel, fetchedTitleLabel])
        hStack.axis = .horizontal
        hStack.spacing = 4
        hStack.alignment = .fill
        hStack.distribution = .fill
        return hStack
    }()
    
    private lazy var isCompletedLabel: UILabel = {
        let label = UILabel()
        label.text = "completed:"
        label.textColor = .black
        label.setContentHuggingPriority(.defaultHigh+35, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var fetchedIsCompletedLabel: UILabel = {
        let passedValue = UILabel()
        passedValue.textColor = .black
        return passedValue
    }()
    
    ///phoneLabel and FieldStack
    private lazy var isCompletedStackView: UIStackView = {
        let vStack = UIStackView(arrangedSubviews: [isCompletedLabel, fetchedIsCompletedLabel])
        vStack.axis = .horizontal
        vStack.spacing = 4
        vStack.alignment = .fill
        vStack.distribution = .fill
        return vStack
    }()
    
    ///main stack
    private lazy var mainStack: UIStackView = {
        let vMainStack = UIStackView(arrangedSubviews: [userIdStackView, idStackView, titleStackView, isCompletedStackView])
        vMainStack.axis = .vertical
        vMainStack.spacing = 10
        vMainStack.distribution = .fill
        vMainStack.alignment = .top
        vMainStack.translatesAutoresizingMaskIntoConstraints = false
        return vMainStack
    }()
    
    
    // MARK: - View LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setup
    private func setup() {
        backgroundColor = .white
        generateChildren()
    }
    
    private func generateChildren() {
        addSubview(mainStack)
        
        NSLayoutConstraint.activate([
            mainStack.safeAreaLayoutGuide.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainStack.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 25),
            mainStack.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -25),
        ])}
}
