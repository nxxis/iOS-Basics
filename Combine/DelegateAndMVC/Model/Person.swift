//
//  Person.swift
//  DelegateAndMVC
//
//  Created by ebpearls on 31/05/2023.
//

import Foundation

struct Person {
    let id = UUID().uuidString
    let name: String
    let address: String
    let phone: Int
    let bio: String
    var isFav: Bool
}
