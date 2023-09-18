//
//  ProfileController.swift
//  Tab-Page VC
//
//  Created by ebpearls on 22/05/2023.
//

import UIKit

class ProfileController: UIViewController {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "lion")
//        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var profileName: UILabel = {
        let label = UILabel()
        label.text = "Partha Chalise"
        label.backgroundColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var profileAge: UILabel = {
        let label = UILabel()
        label.text = "23"
        label.backgroundColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var profileAddress: UILabel = {
        let label = UILabel()
        label.text = "Kupandol"
        label.backgroundColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var vStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [profileName,profileAge,profileAddress])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var hStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageView,vStackView])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private lazy var contentView: UIView = {
        let newView = UIView()
        newView.backgroundColor = .white
        newView.translatesAutoresizingMaskIntoConstraints = false
        return newView
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
         
    }
    
    private func setup() {
        generateChildren()
        
    }
    
    private func generateChildren() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(hStackView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 70),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 35),
            imageView.heightAnchor.constraint(equalToConstant: 150),
            imageView.widthAnchor.constraint(equalToConstant: 150),
            
            //hStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 70),
            hStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 35),
            hStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            hStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -100),
            
        ])
        
        
        
    }
}
