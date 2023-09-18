//
//  DisplayController.swift
//  Data Parsing VC
//
//  Created by ebpearls on 11/05/2023.
//

import UIKit

class DisplayController: UIViewController {
    
    let personDetails: Person
    
    init(personDetails: Person) {
        self.personDetails = personDetails
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UILabel
    private lazy var firstNameTitleLabel: UILabel = {
        let firstNameTitleLabel = UILabel()
        firstNameTitleLabel.text = "First Name:"
        firstNameTitleLabel.textColor = .blue
        return firstNameTitleLabel
    }()
    
    private lazy var lastNameTitleLabel: UILabel = {
        let lastNameTitleLabel = UILabel()
        lastNameTitleLabel.text = "Last Name:"
        lastNameTitleLabel.textColor = .blue
        return lastNameTitleLabel
    }()
    
    private lazy var ageTitleLabel: UILabel = {
        let ageTitleLabel = UILabel()
        ageTitleLabel.text = "Age:"
        ageTitleLabel.textColor = .blue
        return ageTitleLabel
    }()
    
    private lazy var addressTitleLabel: UILabel = {
        let addressTitleLabel = UILabel()
        addressTitleLabel.text = "Address:"
        addressTitleLabel.textColor = .blue
        return addressTitleLabel
    }()
    
    // MARK: - Passed Value
    private lazy var firstNameLabel: UILabel = {
        let firstNameLabel = UILabel()
        firstNameLabel.text = personDetails.fName
        firstNameLabel.textColor = .blue
        return firstNameLabel
    }()
    
    private lazy var lastNameLabel: UILabel = {
        let lastNameLabel = UILabel()
        lastNameLabel.text = personDetails.lName
        lastNameLabel.textColor = .blue
        return lastNameLabel
    }()
    
    private lazy var ageLabel: UILabel = {
        let ageLabel = UILabel()
        let ageString = String(personDetails.age)
        ageLabel.text = ageString
        ageLabel.textColor = .blue
        return ageLabel
    }()
    
    private lazy var addressLabel: UILabel = {
        let addressLabel = UILabel()
        addressLabel.text = personDetails.address
        addressLabel.textColor = .blue
        return addressLabel
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup ()
        title = "\(personDetails.fName)'s" + " " + "Profile"
    }
    
    private func setup () {
        
        view.backgroundColor = .gray
        
        // MARK: - Label
        view.addSubview(firstNameTitleLabel)
        firstNameTitleLabel.frame = CGRect(x: 25, y: 120, width: 90, height: 30)
        
        view.addSubview(lastNameTitleLabel)
        lastNameTitleLabel.frame = CGRect(x: 25, y: 170, width: 90, height: 30)
        
        view.addSubview(ageTitleLabel)
        ageTitleLabel.frame = CGRect(x: 25, y: 220, width: 90, height: 30)
        
        view.addSubview(addressTitleLabel)
        addressTitleLabel.frame = CGRect(x: 25, y: 270, width: 90, height: 30)
        
        // MARK: - Passed Value Label
        view.addSubview(firstNameLabel)
        firstNameLabel.frame = CGRect(x: 120, y: 120, width: 190, height: 30)
        
        view.addSubview(lastNameLabel)
        lastNameLabel.frame = CGRect(x: 120, y: 170, width: 190, height: 30)
        
        view.addSubview(ageLabel)
        ageLabel.frame = CGRect(x: 120, y: 220, width: 190, height: 30)
        
        view.addSubview(addressLabel)
        addressLabel.frame = CGRect(x: 120, y: 270, width: 190, height: 30)
        
        
    }
}

