//
//  ProfileView.swift
//  DelegateAndMVC
//
//  Created by ebpearls on 31/05/2023.
//

import UIKit

class ProfileView: UIView {
    
    
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
        return passedValue
    }()
    
    ///nameLabel and FieldStack
    private lazy var nameStack: UIStackView = {
        let hStack = UIStackView(arrangedSubviews: [nameLabel, passedNameLabel])
        hStack.axis = .horizontal
        hStack.spacing = 4
        hStack.alignment = .fill
        hStack.distribution = .fill
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
        return passedValue
    }()
    
    ///addressLabel and Field Stack
    private lazy var addressStack: UIStackView = {
        let hStack = UIStackView(arrangedSubviews: [addressLabel, passedAddressLabel])
        hStack.axis = .horizontal
        hStack.spacing = 4
        hStack.alignment = .fill
        hStack.distribution = .fill
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
        return passedValue
    }()
    
    ///phoneLabel and FieldStack
    private lazy var phoneNumberStack: UIStackView = {
        let vStack = UIStackView(arrangedSubviews: [phoneLabel, passedPhoneNumber])
        vStack.axis = .horizontal
        vStack.spacing = 4
        vStack.alignment = .fill
        vStack.distribution = .fill
        return vStack
    }()
    
    private lazy var bioLabel: UILabel = {
        let label = UILabel()
        label.text = "Bio:"
        label.textColor = .black
        return label
    }()
    
    lazy var bioValueLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var bioStackView: UIStackView = {
        let vStack = UIStackView(arrangedSubviews: [bioLabel, bioValueLabel])
        vStack.axis = .vertical
        vStack.spacing = 15
        vStack.alignment = .fill
        vStack.distribution = .fill
        return vStack
    }()
    
    lazy var favButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setContentHuggingPriority(.defaultHigh+33, for: .horizontal)
        button.backgroundColor = .systemGray3
        return button
    }()
    
    private lazy var favButtonStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [UIView(),favButton])
        stack.axis = .horizontal
        stack.spacing = 320
        stack.distribution = .fill
        stack.alignment = .trailing
        return stack
    }()
    
    ///main stack
    private lazy var mainStack: UIStackView = {
        let vMainStack = UIStackView(arrangedSubviews: [favButtonStackView, nameStack, addressStack, phoneNumberStack, bioStackView])
        vMainStack.axis = .vertical
        vMainStack.spacing = 10
        vMainStack.distribution = .fill
        vMainStack.alignment = .top
        vMainStack.translatesAutoresizingMaskIntoConstraints = false
        return vMainStack
    }()
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - View Life Cycle
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
        generateChild()
    }
    
    private func generateChild() {
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        
        containerView.addSubview(mainStack)
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            mainStack.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            mainStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant:  20),
            mainStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            mainStack.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -15),
        ])
        
        [nameLabel, addressLabel, phoneLabel].forEach {
            $0.widthAnchor.constraint(equalToConstant: 120).isActive = true
        }
    }
}
