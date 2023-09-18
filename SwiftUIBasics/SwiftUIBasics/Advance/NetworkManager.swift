//
//  NetworkManager.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 02/08/2023.
//

import Apollo
import SwiftUI
import BaralAPI

class NetworkManager {
    
    static var shared = NetworkManager()
    
    lazy var apollo = ApolloClient(url: URL(string: "https://f6ce-202-166-198-75.ngrok-free.app/graphql")!)
    
    private init() {}
    
    func fetchData<T: GraphQLQuery>(query: T, completion: @escaping (Result<T.Data, Error>) -> Void) {
        NetworkManager.shared.apollo.fetch(query: query) { result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data {
                    completion(.success(data))
                } else if let errors = graphQLResult.errors {
                    let error = NSError(domain: "GraphQL", code: 0, userInfo: [NSLocalizedDescriptionKey: errors.description])
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
