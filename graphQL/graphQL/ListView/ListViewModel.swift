//
//  ListViewModel.swift
//  GraphQLImplementation
//
//  Created by ebpearls on 05/07/2023.
//

import Foundation
import Apollo
import GitHub

typealias User = FetchUserQuery.Data.User

class ListViewModel {
    // MARK: - Properties
    
    var obtainedData: (() -> Void)?
    
    var users: User? {
        didSet {
            obtainedData?()
        }
    }
    
    func getUsers() {
        
        let userData = FetchUserQuery(login: "nxxis")
        NetworkManager.shared.fetchData(query: userData) { result in
            guard let data = try? result.get() else {
                return
            }
            self.users = data.user
        }
    }
    
    func performMutation() {
        
        let input = ChangeUserStatusInput(emoji: ":no_entry:", message: "Hello World", limitedAvailability: true)
        NetworkManager.shared.apollo.perform(mutation: UpdateUserStatusMutation(input: input))
    }
}
