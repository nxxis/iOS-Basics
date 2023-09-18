//
//  ViewController.swift
//  DataParsingToViewTable
//
//  Created by ebpearls on 26/05/2023.
//

import UIKit
import CoreData

class FormViewController: UIViewController {
    
    // MARK: - Properties
    private let screenView: FormView
    private var personList: [PersonData] = []
    var selectedPerson: PersonData?
    var showAddButton = true
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    init(with view: FormView) {
        self.screenView = view
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
    
    override func viewWillAppear(_ animated: Bool) {
        showHideAddButton()
    }
    
    private func showHideAddButton() {
        screenView.UpdateButton.isHidden = showAddButton
        screenView.addButton.isHidden = !showAddButton
    }
    
    // MARK: - Setup
    private func setup() {
        setupAddButton()
        setupShowButton()
        setupUpdateButton()
    }
    
    private func setupAddButton() {
        screenView.addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    private func setupShowButton() {
        screenView.showButton.addTarget(self, action: #selector(showButtonTapped), for: .touchUpInside)
    }
    
    private func setupUpdateButton() {
        screenView.UpdateButton.addTarget(self, action: #selector(updateButtonTapped), for: .touchUpInside)
    }
    
    @objc private func updateButtonTapped() {
        
        let textFieldName: String =  screenView.nameField.text!
        let textFieldAddress: String =  screenView.addressField.text!
        let textFieldPhoneNumber: Int = Int(screenView.phoneField.text!) ?? 0
        
        // MARK: - Alert
        if textFieldName == "" || textFieldAddress == "" || textFieldPhoneNumber == 0 {
            let alert = UIAlertController(title: "Error", message: "Please enter valid Information", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        } else {
            guard let person = selectedPerson else {
                return
            }
            person.names = textFieldName
            person.address = textFieldAddress
            person.phoneNumber = Int64(textFieldPhoneNumber)
            do {
                try context.save()
            } catch {
                print("Error updating Core Data: \(error)")
            }
            
            [screenView.nameField, screenView.addressField, screenView.phoneField].forEach {
                $0.text = ""
            }
            
            let alert = UIAlertController(title: "Sucess", message: "Data Updated", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    
    @objc private func addButtonTapped() {
        let textFieldName: String =  screenView.nameField.text!
        let textFieldAddress: String =  screenView.addressField.text!
        let textFieldPhoneNumber: Int = Int(screenView.phoneField.text!) ?? 0
        
        // MARK: - Alert
        if textFieldName == "" || textFieldAddress == "" || textFieldPhoneNumber == 0 {
            let alert = UIAlertController(title: "Error", message: "Please enter value", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            let newPerson = PersonData(context: context)
            newPerson.names = textFieldName
            newPerson.address = textFieldAddress
            newPerson.phoneNumber = Int64(textFieldPhoneNumber)
            
            do {
                try context.save()
            } catch {
                print("Error saving Core Data: \(error)")
            }
            
            personList.append(newPerson)
            
            [screenView.nameField, screenView.addressField, screenView.phoneField].forEach {
                $0.text = ""
            }
            
            let alert = UIAlertController(title: "Sucess", message: "Data Added", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func showButtonTapped() {
        
        let fetchRequest: NSFetchRequest<PersonData> = PersonData.fetchRequest()
        do {
            personList = try context.fetch(fetchRequest)
        } catch {
            print("Error fetching Core Data: \(error)")
        }
        
        let vc = ListViewController(screenView: ListView(), personList: personList)
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension FormViewController: ListViewDelegate {
    func sendDataToFormVC(person: PersonData) {
        selectedPerson = person
        screenView.nameField.text = person.names
        screenView.addressField.text = person.address
        screenView.phoneField.text = "\(person.phoneNumber)"
        showAddButton = false
    }
    
    func restateFormVC () {
        showAddButton = true
    }
}
