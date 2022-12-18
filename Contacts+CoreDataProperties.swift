//
//  Contacts+CoreDataProperties.swift
//  Address-Book
//
//  Created by Don Bouncy on 17/12/2022.
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
    @NSManaged public var phoneNumber: String?
    @NSManaged public var emails: NSSet?
    @NSManaged public var phoneNumbers: NSSet?

}

// MARK: Generated accessors for emails
extension Contacts {

    @objc(addEmailsObject:)
    @NSManaged public func addToEmails(_ value: Emails)

    @objc(removeEmailsObject:)
    @NSManaged public func removeFromEmails(_ value: Emails)

    @objc(addEmails:)
    @NSManaged public func addToEmails(_ values: NSSet)

    @objc(removeEmails:)
    @NSManaged public func removeFromEmails(_ values: NSSet)

}

// MARK: Generated accessors for phoneNumbers
extension Contacts {

    @objc(addPhoneNumbersObject:)
    @NSManaged public func addToPhoneNumbers(_ value: PhoneNumbers)

    @objc(removePhoneNumbersObject:)
    @NSManaged public func removeFromPhoneNumbers(_ value: PhoneNumbers)

    @objc(addPhoneNumbers:)
    @NSManaged public func addToPhoneNumbers(_ values: NSSet)

    @objc(removePhoneNumbers:)
    @NSManaged public func removeFromPhoneNumbers(_ values: NSSet)

}

extension Contacts : Identifiable {

}
