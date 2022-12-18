//
//  PhoneNumbers+CoreDataProperties.swift
//  Address-Book
//
//  Created by Don Bouncy on 17/12/2022.
//
//

import Foundation
import CoreData


extension PhoneNumbers {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PhoneNumbers> {
        return NSFetchRequest<PhoneNumbers>(entityName: "PhoneNumbers")
    }

    @NSManaged public var phoneNumber: String?
    @NSManaged public var contacts: Contacts?

}

extension PhoneNumbers : Identifiable {

}
