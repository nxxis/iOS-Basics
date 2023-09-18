//
//  ListViewModel.swift
//  GraphQLImplementation
//
//  Created by ebpearls on 05/07/2023.
//

import Foundation
import Apollo
import SocialNetwork

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
        let userData = FetchUserQuery(id: "2")
        NetworkManager.shared.fetchData(query: userData) { result in
            guard let data = try? result.get() else {
                return
            }
            self.users = data.user
        }
    }
    
    func performMutation() {
        
        let input = UpdatePostInput(title: "updated title", body: "hello partha")
        
        NetworkManager.shared.apollo.perform(mutation: UpdatePostMutation(id: "2", input: input))
    }
}
