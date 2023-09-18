//
//  Person.swift
//  CollectionView
//
//  Created by ebpearls on 19/05/2023.
//

import UIKit

struct Person {
    let name: String
    let address: String
    let age: Int
    let image: UIImage
    
    static func getPersons() -> [Person] {
        let persons = [
            Person(name: "Sudip", address: "Chitwan", age: 23, image: UIImage(named: "tiger")!),
            Person(name: "Partha", address: "Hattiban", age: 23, image: UIImage(named: "lion")!),
            Person(name: "Pranjal", address: "Baneshwor", age: 23, image: UIImage(named: "zebra")!),
            Person(name: "Roshan", address: "Kupandole", age: 23, image: UIImage(named: "giraffe")!),
        ]
        return persons
    }
    
}


