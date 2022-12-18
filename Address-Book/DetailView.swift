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
        Group {
            if edit{
                
            } else {
                InfoView(firstName: contact.wrappedFirstName, lastName: contact.wrappedLastName, phoneNumbers: contact.wrappedPhoneNumbers, emails: contact.wrappedEmails, address: contact.wrappedAddress)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Edit") {
                    if edit{
                        
                    }
                    edit.toggle()
                }
            }
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
