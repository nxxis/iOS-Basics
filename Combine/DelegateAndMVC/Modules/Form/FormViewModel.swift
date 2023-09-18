//
//  FormViewModel.swift
//  DelegateAndMVC
//
//  Created by ebpearls on 18/07/2023.
//

import Foundation
import Combine

class FormViewModel {
    weak var formDelegate: FormDelegate?
    
    func addPerson(_ person: Person) {
        formDelegate?.personObtained(person)
    }
    
    init(formDelegate: FormDelegate?) {
        self.formDelegate = formDelegate
    }
}
