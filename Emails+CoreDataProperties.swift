//
//  Emails+CoreDataProperties.swift
//  Address-Book
//
//  Created by Don Bouncy on 17/12/2022.
//
//

import Foundation
import CoreData


extension Emails {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Emails> {
        return NSFetchRequest<Emails>(entityName: "Emails")
    }

    @NSManaged public var email: String?
    @NSManaged public var contacts: Contacts?

}

extension Emails : Identifiable {

}
