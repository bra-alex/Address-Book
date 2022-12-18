//
//  Contacts+CoreDataProperties.swift
//  Address-Book
//
//  Created by Don Bouncy on 18/12/2022.
//
//

import Foundation
import CoreData


extension Contacts {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contacts> {
        return NSFetchRequest<Contacts>(entityName: "Contacts")
    }

    @NSManaged public var address: String?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var phoneNumbers: [String]?
    @NSManaged public var emails: [String]?
    @NSManaged public var id: UUID?
    
    public var wrappedFirstName: String{
        firstName ?? "N/A"
    }
    
    public var wrappedLastName: String{
        lastName ?? "N/A"
    }
    
    public var wrappedAddress: String{
        address ?? "N/A"
    }
    
    public var wrappedEmails: [String]{
        emails ?? ["N/A"]
    }
    
    public var wrappedPhoneNumbers: [String]{
        phoneNumbers ?? ["N/A"]
    }
    
}

extension Contacts : Identifiable {

}
