//
//  SignUpViewModel.swift
//  SocialNetwork
//
//  Created by ebpearls on 03/08/2023.
//

import SocialNetworkAPI
import SwiftUI

class SignUpViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var email: String = ""
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var alertTitle: String = ""
    @Published var alertMessage: String = ""
    
    @Published var showAlert: Bool = false
    
    // MARK: - createUser
    func createUser() {
        
        let input = CreateUserInput(username: username, email: email, password: password)
        
        NetworkLayer.shared.apollo.perform(mutation: CreateUserMutation(createUserInput: input)) {
            result in
            switch result {
                
            case .success(let data):
                if (data.data?.createUser) != nil {
                    self.alertTitle = "Success"
                    self.alertMessage = "Signed up successfully"
                    self.showAlert.toggle()
                } else {
                    self.alertTitle = "API Error!"
                    self.showAlert.toggle()
                    self.alertMessage = data.errors?.description ?? ""
                }
                
            case .failure(_):
                self.alertTitle = "Error!"
                self.alertMessage = "No internet connection"
                self.showAlert.toggle()
            }
        }
    }
}
