//
//  ProfileView.swift
//  quotesSudip
//
//  Created by ebpearls on 30/06/2023.
//

import UIKit

class ProfileView: UIView {
    
    // MARK: - UI
    private lazy var quoteLabel: UILabel = {
        let label = UILabel()
        label.text = "Quote:"
        label.setContentHuggingPriority(.defaultHigh+35, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var quoteDataLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    ///quoteStack
    private lazy var quoteStackView: UIStackView = {
        let hStack = UIStackView(arrangedSubviews: [quoteLabel, quoteDataLabel])
        hStack.axis = .horizontal
        hStack.spacing = 4
        hStack.distribution = .fill
        return hStack
    }()
    
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.text = "Author:"
        label.textColor = .black
        label.setContentHuggingPriority(.defaultHigh+35, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var authorDataLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    ///author Stack
    private lazy var authorStackView: UIStackView = {
        let hStack = UIStackView(arrangedSubviews: [authorLabel, authorDataLabel])
        hStack.axis = .horizontal
        hStack.spacing = 4
        hStack.distribution = .fill
        return hStack
    }()
    
    private lazy var detailStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [authorStackView, quoteStackView])
        view.axis = .vertical
        view.spacing = 10
        view.distribution = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - View Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setup
    private func setup() {
        generateChild()
    }
    
    // MARK: - generateChild
    private func generateChild() {
        addSubview(detailStackView)
        
        NSLayoutConstraint.activate([
            detailStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            detailStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            detailStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
        
        [quoteLabel, authorLabel].forEach {
            $0.widthAnchor.constraint(equalToConstant: 60).isActive = true
        }
    }
    
    // MARK: - Configure Data
    func configure(quote: Quote) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            self.quoteDataLabel.text = quote.quote
            self.authorDataLabel.text = quote.author
        }
    }
}
