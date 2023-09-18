//
//  ViewController.swift
//  DelegateAndMVC
//
//  Created by ebpearls on 31/05/2023.
//

import UIKit
import Combine

class FormViewController: UIViewController {
    
    // MARK: - Properties
    private let screenView: FormView
    
    let viewModel: FormViewModel
    
    var formCoordinator: FormCoordinator?
    
    // MARK: - Initilization
    init(screenView: FormView, viewModel: FormViewModel) {
        self.screenView = screenView
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
        let textFieldPhoneNumber = Int(screenView.phoneField.text!) ?? 0
        let textViewBio = screenView.bioTextView.text!
        
        if !screenView.phoneField.text!.isValidPhoneNumber() {
            
            let person = Person(name: textFieldName, address: textFieldAddress, phone: textFieldPhoneNumber, bio: textViewBio, isFav: switchStateChanged())
            
            viewModel.addPerson(person)
            
            let alert = UIAlertController(title: "Success", message: "Person Added Successfully!!", preferredStyle: UIAlertController.Style.alert)
            
            let okayAction = UIAlertAction(title: "OK", style: .default) { _ in
                self.formCoordinator?.parentCoordinator?.removeChildCoordinator(child: self.formCoordinator!)
                self.navigationController?.popToRootViewController(animated: true)
            }
            
            alert.addAction(okayAction)
            present(alert, animated: true)
        } else {
            
            let alert = UIAlertController(title: "Error", message: "Please enter a proper phone number", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            present(alert, animated: true, completion: nil)
        }}
}
/// xcode 15
//#Preview("FormViewController"){
//    FormViewController()
//}

