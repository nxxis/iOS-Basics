//
//  Person.swift
//  DelegateAndMVC
//
//  Created by ebpearls on 31/05/2023.
//

import Foundation

struct ProductDetailsPost: Codable {
    let products: [ProductsPost]?
}

struct ProductsPost: Codable {
    let productId: Int
    let productTitle: String
    let productDescription: String
    let productPrice: Int
    
    enum CodingKeys: String, CodingKey {
        case productId = "id"
        case productTitle = "title"
        case productDescription = "description"
        case productPrice = "price"
    }
}

struct ProductDetailsGet: Codable {
    let products: [ProductsGet]?
}

struct ProductsGet: Codable {
    let productId: Int
    let productTitle: String
    let productDescription: String
    let productPrice: Int
    let thumbnail: String
    let images: [String]
    
    enum CodingKeys: String, CodingKey {
        case productId = "id"
        case productTitle = "title"
        case productDescription = "description"
        case productPrice = "price"
        case thumbnail,images
    }
}






