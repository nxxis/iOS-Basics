//
//  ListViewModel.swift
//  quotesSudip
//
//  Created by ebpearls on 30/06/2023.
//

import Foundation

class ListViewModel {
    
    // MARK: - properties
    private let httpUtility: HttpUtility
    
    private var totalItems = 0
    private let limit = 15
    private var skip = 0
    private var hasNextPage: Bool = true
    
    var dataObtained: (() -> Void)?
    var randomQuoteObtained: (() -> Void)?
    var errorObtained: (() -> Void)?
    var indicatorStart: ((Bool) -> Void)?
    var indicatorStop: (() -> Void)?
    var alert: ((String) -> Void)?
    var refreshData: (() -> Void)?
    
    var errorMessage: String?
    
    var quotes: [Quote] = []
    var randomQuotes: Quote?
    
    // MARK: - initilization
    init(httpUtility: HttpUtility){
        self.httpUtility = httpUtility
    }
    
    // MARK: - getData
    func getQuotes(refresh: Bool = false) {
        indicatorStart?(refresh)
        if refresh {
            skip = 0
            quotes = []
            refreshData?()
        }
        let urlString = "https://dummyjson.com/quotes?limit=\(limit)&skip=\(skip)"
        if let url = URL(string: urlString) {
            httpUtility.getApiData(requestUrl: url, resultType: Quotes.self) { result in
                switch result {
                case .success(let quoteContainer):
                    DispatchQueue.main.asyncAfter(deadline: .now()+1.3) {
                        self.indicatorStop?()
                        self.dataObtained?()
                    }
                    self.quotes += quoteContainer.quotes
                    
                    self.totalItems = quoteContainer.total
                    
                    self.configure()
                    
                case .failure(let error):
                    self.alert?(error.localizedDescription)
                }
            }
        }
    }
    
    // MARK: - configure
    private func configure() {
        hasNextPage = quotes.count < totalItems // true
        if hasNextPage {
            skip += limit
        }
    }
    
    // MARK: - checkForPagination
    func checkForPagination(quote: Quote) {
        if let last = quotes.last,
           last.id == quote.id && hasNextPage
        {
            getQuotes(refresh: false)
        }
    }
    
    // MARK: - getRandomQuote
    func getRandomQuote() {
        
        if let url = URL(string: "https://dummyjson.com/quotes/random") {
            
            httpUtility.getApiData(requestUrl: url, resultType: Quote.self) { result in
                switch result {
                case .success(let quoteContainer):
                    self.randomQuotes = quoteContainer
                    self.randomQuoteObtained?()
                case .failure(let error):
                    self.alert?(error.localizedDescription)
                }
            }
        }
    }
    
    // MARK: - getError
    func getError() {
        
        if let url = URL(string: "https://dummyjson.com/quotes/-123444") {
            
            httpUtility.getApiData(requestUrl: url, resultType: APIError.self) { result in
                switch result {
                case .success(let errorContainer):
                    print(errorContainer)
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    self.errorObtained?()
                }
            }
        }
    }
}
