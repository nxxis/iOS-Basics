//
//  Products+CoreDataProperties.swift
//  
//
//  Created by ebpearls on 23/06/2023.
//
//

import Foundation
import CoreData


extension Products {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Products> {
        return NSFetchRequest<Products>(entityName: "Products")
    }

    @NSManaged public var id: Int16
    @NSManaged public var title: String?
    @NSManaged public var descriptions: String?
    @NSManaged public var price: Int16
    @NSManaged public var thumbnail: String?
    @NSManaged public var images: [String]?

}
