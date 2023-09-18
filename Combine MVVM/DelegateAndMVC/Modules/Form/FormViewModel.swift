//
//  FormViewModel.swift
//  DelegateAndMVC
//
//  Created by ebpearls on 29/06/2023.
//

import Foundation
import Combine

class FormViewModel {
    
    // MARK: - addButtonTapped
    func addButtonTapped(person: Person, completion: @escaping (Bool) -> Void) {
        let isValidPhoneNumber = String(person.phone).isValidPhoneNumber()
        if isValidPhoneNumber {
            NotificationCenter.default.post(name: .formData, object: person)
        }
        completion(isValidPhoneNumber)
    }
}
