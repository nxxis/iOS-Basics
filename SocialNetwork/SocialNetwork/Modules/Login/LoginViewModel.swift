//
//  LoginViewModel.swift
//  SocialNetwork
//
//  Created by ebpearls on 03/08/2023.
//

import SocialNetworkAPI
import SwiftUI

class LoginViewModel: ObservableObject  {
    
    // MARK: - Properties
    @Published var isUserValid: Bool = false
    
    @AppStorage("token") var accessToken: String?
    
    var userData: UserValidateQuery.Data.ValidateUser?
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var user: User?
    
    // MARK: - validateUser
    func validateUser() {
        
        let loginData = LoginInput(email: email, password: password)
        
        let query = UserValidateQuery(loginData: loginData)
        
        NetworkLayer.shared.fetchData(query: query) { result in
            switch result {
                
            case .success(_):
                self.isUserValid = true
                
                guard let data = try? result.get() else {
                    return
                }
                self.accessToken = data.validateUser.access_token
                self.userData = data.validateUser
                
            case .failure(_):
                self.isUserValid = false
            }
        }
    }
}
