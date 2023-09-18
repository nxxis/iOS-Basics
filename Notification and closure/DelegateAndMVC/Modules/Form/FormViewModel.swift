//
//  FormViewModel.swift
//  DelegateAndMVC
//
//  Created by ebpearls on 29/06/2023.
//

import Foundation
import Combine
class FormViewModel {
    
    var personSubject = PassthroughSubject <Person, Never>()
    
    // MARK: - addButtonTapped
    func addButtonTapped(person: Person, completion: @escaping (Bool) -> Void) {
        personSubject.send(person)
        let isValidPhoneNumber = String(person.phone).isValidPhoneNumber()
        if isValidPhoneNumber {
            NotificationCenter.default.post(name: .formData, object: person)
        }
        completion(isValidPhoneNumber)
    }
}
