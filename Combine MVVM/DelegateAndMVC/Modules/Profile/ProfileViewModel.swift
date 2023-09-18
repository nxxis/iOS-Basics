//
//  ProfileViewModel.swift
//  DelegateAndMVC
//
//  Created by ebpearls on 29/06/2023.
//

import Foundation

class ProfileViewModel {
    
    // MARK: - properties
    let personData: Person
    
    // MARK: - initilization
    init(personData: Person) {
        self.personData = personData
    }
    
    // MARK: - isFav
    func isFav() -> Bool {
        personData.isFav
    }
}
