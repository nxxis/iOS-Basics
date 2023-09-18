//
//  ListViewCell.swift
//  quotesSudip
//
//  Created by ebpearls on 30/06/2023.
//

import UIKit

class ListViewCell: UITableViewCell {
    
    // MARK: - UI
    lazy var quoteDataLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var authorDataLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var detailStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [authorDataLabel, quoteDataLabel])
        view.axis = .vertical
        view.spacing = 10
        view.distribution = .fill
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
    
    // MARK: - setup
    private func setup() {
        generateChild()
    }
    
    // MARK: - generateChild
    private func generateChild() {
        contentView.addSubview(detailStackView)
        
        NSLayoutConstraint.activate([
            
            detailStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            detailStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            detailStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            detailStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
        ])
    }
    
    func configure(quote: Quote) {
        quoteDataLabel.text = quote.quote
        authorDataLabel.text = quote.author
    }
}
