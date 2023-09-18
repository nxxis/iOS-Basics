//
//  User.swift
//  UrlSession
//
//  Created by ebpearls on 20/07/2023.
//

import Foundation

struct User: Decodable {
    let id: Int
    let name: String
    let email: String
    let gender: String
}
