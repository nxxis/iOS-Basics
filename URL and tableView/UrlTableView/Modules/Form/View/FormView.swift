//
//  FormView.swift
//  UrlTableView
//
//  Created by ebpearls on 13/06/2023.
//

import UIKit

class FormView: UIView {
    
    // MARK: - UI
    private lazy var idLabel: UILabel = {
        let label = UILabel()
        label.text = "id:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var idField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray4
        textField.placeholder = "Enter your id"
        textField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        return textField
    }()
    
    ///nameLabel and FieldStack
    private lazy var idStackView: UIStackView = {
        let hStack = UIStackView(arrangedSubviews: [idLabel, idField])
        hStack.axis = .vertical
        hStack.spacing = 5
        hStack.alignment = .fill
        hStack.distribution = .fill
        return hStack
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "title:"
        label.textColor = .black
        return label
    }()
    
    lazy var titleField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.backgroundColor = .systemGray4
        textField.placeholder = "Enter your title"
        textField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        return textField
    }()
    
    ///addressLabel and Field Stack
    private lazy var titleStackView: UIStackView = {
        let hStack = UIStackView(arrangedSubviews: [titleLabel, titleField])
        hStack.axis = .vertical
        hStack.spacing = 5
        hStack.alignment = .fill
        hStack.distribution = .fill
        return hStack
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "price:"
        label.textColor = .black
        return label
    }()
    
    lazy var priceField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.backgroundColor = .systemGray4
        textField.placeholder = "Enter price"
        textField.keyboardType = .numberPad
        textField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        return textField
    }()
    
    ///phoneLabel and FieldStack
    private lazy var priceStackView: UIStackView = {
        let vStack = UIStackView(arrangedSubviews: [priceLabel, priceField])
        vStack.axis = .vertical
        vStack.spacing = 5
        vStack.alignment = .fill
        vStack.distribution = .fill
        return vStack
    }()
    
    private lazy var decriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Description:"
        label.textColor = .black
        return label
    }()
    
    lazy var descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .systemGray4
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = .systemFont(ofSize: 16)
        textView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        return textView
    }()
    
    private lazy var descriptionStackView: UIStackView = {
        let vStack = UIStackView(arrangedSubviews: [decriptionLabel, descriptionTextView])
        vStack.axis = .vertical
        vStack.spacing = 5
        vStack.alignment = .fill
        vStack.distribution = .fill
        return vStack
    }()
    
    ///main stack
    private lazy var mainStack: UIStackView = {
        let vMainStack = UIStackView(arrangedSubviews: [idStackView, titleStackView, priceStackView, descriptionStackView])
        vMainStack.axis = .vertical
        vMainStack.spacing = 15
        vMainStack.distribution = .fill
        vMainStack.alignment = .fill
        vMainStack.translatesAutoresizingMaskIntoConstraints = false
        return vMainStack
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .systemGray4
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        generateChild()
    }
    
    // MARK: - generateChild
    private func generateChild() {
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(mainStack)
        containerView.addSubview(addButton)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            mainStack.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            mainStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            mainStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            
            addButton.widthAnchor.constraint(equalToConstant: 50),
            addButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            addButton.topAnchor.constraint(equalTo: mainStack.bottomAnchor, constant: 45),
            addButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -25),
            
            idLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width-40),
        ])
    }
}
