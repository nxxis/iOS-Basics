//
//  ViewController.swift
//  DelegateAndMVC
//
//  Created by ebpearls on 31/05/2023.
//

import UIKit

class FormViewController: UIViewController {
    
    // MARK: - Properties
    private let screenView: FormView
    private let viewModel: FormViewModel
    
    var showAlertClosure: ((String, String) -> Void)?
    
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
        setupSwitch()
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
    
    // MARK: - setupSwitch
    private func setupSwitch() {
        screenView.favSwitch.addTarget(self, action: #selector(switchStateChanged), for: .valueChanged)
    }
    
    // MARK: - SwitchButton
    @objc private func switchStateChanged() -> Bool {
        if screenView.favSwitch.isOn == true {
            return true
        }
        else {
            return false
        }
    }
    
    // MARK: - addButtonTapped
    @objc private func addButtonTapped() {
        
        let textFieldName =  screenView.nameField.text!
        let textFieldAddress =  screenView.addressField.text!
        let textFieldPhoneNumber = screenView.phoneField.text ?? ""
        let textViewBio = screenView.bioTextView.text!
        
        let person = Person(name: textFieldName, address: textFieldAddress, phone: Int(textFieldPhoneNumber) ?? 0, bio: textViewBio, isFav: switchStateChanged())
        
        viewModel.addButtonTapped(person: person) { [weak self] isValidPhoneNumber in
            guard let self = self else {return}
            if isValidPhoneNumber {
                let alert = UIAlertController(title: "Success", message: "Person Added Successfully!!", preferredStyle: .alert)
                let okayAction = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
                    guard let self = self else {return}
                    self.navigationController?.popToRootViewController(animated: true)
                }
                alert.addAction(okayAction)
                self.present(alert, animated: true)
            } else {
                let alert = UIAlertController(title: "Error", message: "Please enter a proper phone number", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
        }
    }
}
/// xcode 15
//#Preview("FormViewController"){
//    FormViewController()
//}

