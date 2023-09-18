//
//  SignupViewModel.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 02/08/2023.
//

import Foundation
import BaralAPI

class SignupViewModel {
    
    var UserArr: [User] = []
    
    
    func performMutation(username: String, email: String, password: String) {
    
        let input = CreateUserInput(username: username, email: email, password: password)
        
        NetworkManager.shared.apollo.perform(mutation: SignUpMutation(createUserInput: input))
    }
}
