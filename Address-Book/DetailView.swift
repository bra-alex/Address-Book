//
//  DetailView.swift
//  Address-Book
//
//  Created by Don Bouncy on 17/12/2022.
//

import SwiftUI

struct DetailView: View {
    @State private var edit = false
    
    let contact: Contacts
    
    var body: some View {
        if edit{
            EditView(doneEditing: $edit, firstName: contact.wrappedFirstName, lastName: contact.wrappedLastName, emails: contact.wrappedEmails, phoneNumbers: contact.wrappedPhoneNumbers, address: contact.wrappedAddress, id: contact.id!)
        } else {
            InfoView(edit: $edit, firstName: contact.wrappedFirstName, lastName: contact.wrappedLastName, phoneNumbers: contact.wrappedPhoneNumbers, emails: contact.wrappedEmails, address: contact.wrappedAddress)
                
        }
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView{
//            DetailView()
//        }
//    }
//}
