//
//  FormViewController.swift
//  UrlTableView
//
//  Created by ebpearls on 13/06/2023.
//

import UIKit

class FormViewController: UIViewController {
    
    // MARK: - Properties
    private let screenView: FormView
    private let viewModel: FormViewModel
    
    var formCoordinator: FormCoordinator?
    
    // MARK: - Initilization
    init(view: FormView, viewModel: FormViewModel) {
        self.screenView = view
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Controlller Life Cycle
    override func loadView() {
        super.loadView()
        view = screenView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Setup
    private func setup() {
        setupAddButton()
        setupNavBar()
    }
    
    // MARK: - setupNavBar
    private func setupNavBar() {
        navigationItem.title = "Sign Up"
    }
    
    // MARK: - setupAddButton
    private func setupAddButton() {
        screenView.addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - setupAlert
    func setupAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okayAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okayAction)
        
        present(alert, animated: true)
    }
    
    // MARK: - addButtonTapped
    @objc private func addButtonTapped() {
        
        let id = (Int(screenView.idField.text ?? "") ?? 0)
        let title = screenView.titleField.text ?? ""
        let description = screenView.descriptionTextView.text ?? ""
        let price = Int(screenView.priceField.text ?? "") ?? 0
        
        let request = ProductsPost(productId: id, productTitle: title, productDescription: description, productPrice: price)
        
        viewModel.postApi(product: request)
        
        if !screenView.priceField.text!.isValidPhoneNumber() {
            
            let alert = UIAlertController(title: "Success", message: "Person Added Successfully!!", preferredStyle: UIAlertController.Style.alert)
            
            let okayAction = UIAlertAction(title: "OK", style: .default) { [weak self]_ in
                guard let self = self else { return }
                self.formCoordinator?.navigationController.popToRootViewController(animated: true)
            }
            
            alert.addAction(okayAction)
            present(alert, animated: true)
            
        } else {
            
            setupAlert(title: "Error", message: "Please enter a proper phone number")
        }
    }
}

