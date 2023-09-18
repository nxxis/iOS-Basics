//
//  Quote.swift
//  quotesSudip
//
//  Created by ebpearls on 30/06/2023.
//

import Foundation

// MARK: - Quotes
struct Quotes: Decodable {
    let quotes: [Quote]
    let total, skip, limit: Int

}

// MARK: - Quote
struct Quote: Decodable {
    let id: Int
    let quote, author: String
}

struct APIError: Decodable, Error {
    let message: String
}
