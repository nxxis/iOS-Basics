//
//  HomeViewModel.swift
//  UrlSession
//
//  Created by ebpearls on 20/07/2023.
//

import Foundation
import Combine

class HomeViewModel {
    private let networkManager: NetworkService
    
    let output = PassthroughSubject <User, Never>()
    
    private var cancellables = Set<AnyCancellable>()
    
    init(networkManager: NetworkService = HttpUtility()) {
        self.networkManager = networkManager
    }
    
    func handleUser() {
        networkManager.getUserDetails().sink { completion  in
            print(completion)
        } receiveValue: { user in
            self.output.send(user[1])
        }.store(in: &cancellables)
    }
}
