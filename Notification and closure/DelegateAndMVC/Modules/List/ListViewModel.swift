//
//  ListViewModel.swift
//  DelegateAndMVC
//
//  Created by ebpearls on 29/06/2023.
//

import Foundation
class ListViewModel {
    
    // MARK: - properties
    var reloadTable: (() -> Void)?
    var searchText: String = ""
    
    var personList: [Person] = [] {
        didSet {
            filteredData = personList
        }
    }
    
    var filteredData: [Person] = [] {
        didSet {
           reloadTable?()
        }
    }
    
    // MARK: - doSearch
    func doSearch(searchText: String) {
        self.searchText = searchText
        filteredData = searchText.isEmpty ? personList : personList.filter { person in
            return person.name.range(of: searchText, options: .caseInsensitive) != nil
        }
    }
    
    // MARK: - didTapFavoriteButton
    func didTapFavoriteButton(id: String) {
        if let indexValue = personList.firstIndex(where: {$0.id == id }) {
            personList[indexValue].isFav.toggle()
        }
        doSearch(searchText: searchText)
    }
    
    func configureNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateCellData), name: .formData, object: nil)
    }
    
    @objc func updateCellData(notification: Notification) {
        if let submittedData = notification.object as? Person {
            personList.append(submittedData)
        }
    }
}
