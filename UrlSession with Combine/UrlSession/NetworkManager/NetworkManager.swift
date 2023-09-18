//
//  NetworkManager.swift
//  UrlSession
//
//  Created by ebpearls on 20/07/2023.
//

import Combine
import UIKit

protocol NetworkService {
    func getUserDetails() -> AnyPublisher<[User], Error>
}

class HttpUtility: NetworkService {
    
    func getUserDetails() -> AnyPublisher<[User], Error> {
        let urlString = "https://gorest.co.in/public/v2/users"
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .mapError { error in
                error as Error
            }
            .map { $0.data }
            .decode(type: [User].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

