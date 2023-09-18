//
//  ProfileViewModel.swift
//  quotesSudip
//
//  Created by ebpearls on 30/06/2023.
//

import Foundation

class DetailViewModel {
    
    // MARK: - properties
    private let networkUtility: HttpUtility
    private let id: Int
    
    var quote: Quote?
    
    var quoteObtained: (()->Void)?
    
    // MARK: - initilization
    init(id: Int, networkUtility: HttpUtility) {
        self.networkUtility = networkUtility
        self.id = id
    }
    
    // MARK: - getData
    func getData() {
        if let url = URL(string: "https://dummyjson.com/quotes/" + "\(id)") {
            
            networkUtility.getApiData(requestUrl: url, resultType: Quote.self) { result in
                switch result {
                case .success(let quoteContainer):
                    self.quote = quoteContainer
                    self.quoteObtained?()
                case .failure(let error):
                    print("Error occurred: \(error.localizedDescription)")
                }
            }
        }
    }
}
