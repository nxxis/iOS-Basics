//
//  ListViewModel.swift
//  DelegateAndMVC
//
//  Created by ebpearls on 18/07/2023.
//

import Foundation
import Combine

class ListViewModel {
    
    // MARK: - properties
    var searchText = ""
    var checkEmpty: (() -> Void)?
    
    var personList: [Person] = [] {
        didSet {
            filteredData = personList
        }
    }
    
    var filteredData: [Person] = [] {
        didSet {
            checkEmpty?()
        }
    }
    
    // MARK: - search
    func search(searchText: String) {
        self.searchText = searchText
        filteredData = searchText.isEmpty ? personList : personList.filter { person in
            return person.name.range(of: searchText, options: .caseInsensitive) != nil
        }
    }
}

// MARK: - FormDelegate
extension ListViewModel: FormDelegate {
    func personObtained(_ person: Person) {
        self.personList.append(person)
    }
}
