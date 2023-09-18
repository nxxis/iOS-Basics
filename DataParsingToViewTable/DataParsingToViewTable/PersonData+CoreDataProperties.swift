//
//  PersonData+CoreDataProperties.swift
//  DataParsingToViewTable
//
//  Created by ebpearls on 23/06/2023.
//
//

import Foundation
import CoreData


extension PersonData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PersonData> {
        return NSFetchRequest<PersonData>(entityName: "PersonData")
    }

    @NSManaged public var address: String?
    @NSManaged public var names: String?
    @NSManaged public var phoneNumber: Int64

}

extension PersonData : Identifiable {

}
