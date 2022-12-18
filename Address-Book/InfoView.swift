//
//  InfoView.swift
//  Address-Book
//
//  Created by Don Bouncy on 18/12/2022.
//

import SwiftUI

struct InfoView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @Binding var edit: Bool
    
    let firstName: String
    let lastName: String
    let phoneNumbers: [String]
    let emails: [String]
    let address: String
    
    var body: some View {
        List {
            Text("\(firstName) \(lastName)")
                .font(.title.bold())
                .frame(maxWidth: .infinity, alignment: .center)
            
            Section(phoneNumbers.count <= 1 ? "Phone Number" : "Phone Numbers") {
                ForEach(phoneNumbers, id: \.self) { phoneNumber in
                    VStack(alignment: .leading) {
                        Text(phoneNumber)
                    }
                }
            }
            
            Section(emails.count <= 1 ? "Email" : "Emails") {
                ForEach(emails, id: \.self) { email in
                    VStack(alignment: .leading) {
                        Text(email)
                    }
                }
            }
            
            Section("Address") {
                Text(address)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Edit") {
                    withAnimation {
                        edit.toggle()
                    }
                }
            }
        }
    }
}
