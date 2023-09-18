//
//  SignInViewModel.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 02/08/2023.
//

import Foundation
import BaralAPI

typealias UserT = SignInQuery.Data.ValidateUser

class SignInViewModel {
    
    var user: UserT?
    
    func validateUser(email: String, password: String) {
        
        let data = LoginInput(email: email, password: email)
        
        NetworkManager.shared.fetchData(query: SignInQuery(loginData: data)) { result in
            guard let data = try? result.get() else {
                return
            }
            self.user = data.validateUser
        }
    }
}
