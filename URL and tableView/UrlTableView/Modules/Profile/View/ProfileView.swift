//
//  ProfileView.swift
//  DelegateAndMVC
//
//  Created by ebpearls on 31/05/2023.
//

import UIKit

class ProfileView: UIView {
    
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
        hStack.spacing = 4
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
        hStack.spacing = 4
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
        hStack.spacing = 4
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
        vStack.spacing = 4
        vStack.alignment = .fill
        vStack.distribution = .fill
        return vStack
    }()
    
    ///main stack
    private lazy var mainStack: UIStackView = {
        let vMainStack = UIStackView(arrangedSubviews: [userIdStackView, idStackView, emailStackView, genderStackView])
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
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.registerCollectionCell(cell: ProfileViewCell.self)
        collectionView.backgroundColor = .systemGray6
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = .zero
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.pageIndicatorTintColor = .black
        pageControl.currentPageIndicatorTintColor = .red
        pageControl.contentMode = .scaleToFill
        return pageControl
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
    // MARK: - generateChild
    private func generateChild() {
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(mainStack)
        containerView.addSubview(collectionView)
        containerView.addSubview(pageControl)
        
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
            
            collectionView.heightAnchor.constraint(equalToConstant: 200),
            collectionView.topAnchor.constraint(equalTo: mainStack.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: mainStack.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: mainStack.trailingAnchor),
            
            pageControl.widthAnchor.constraint(equalToConstant: 120),
            pageControl.heightAnchor.constraint(equalToConstant: 30),
            pageControl.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 15),
            pageControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -15),
        ])
        
        [userIdLabel, nameLabel, emailLabel, genderLabel].forEach {
            $0.widthAnchor.constraint(equalToConstant: 120).isActive = true
        }
    }
}
