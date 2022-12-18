//
//  EditView.swift
//  Address-Book
//
//  Created by Don Bouncy on 18/12/2022.
//

import SwiftUI

struct EditView: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: []) var contacts: FetchedResults<Contacts>
    
    @Binding var doneEditing: Bool
    
    @State var firstName: String
    @State var lastName: String
    @State var emails: [String]
    @State var phoneNumbers: [String]
    @State var address: String
    let id: UUID
    
    var body: some View {
        Form {
            Section{
                TextField("First Name", text: $firstName)
                    .textInputAutocapitalization(.words)
                    .autocorrectionDisabled()
                
                TextField("Last Name", text: $lastName)
                    .textInputAutocapitalization(.words)
                    .autocorrectionDisabled()
            }
            
            Section{
                ForEach(phoneNumbers.indices, id: \.self){ i in
                    HStack{
                        TextField("Phone Number", text: $phoneNumbers[i])
                            .keyboardType(.phonePad)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                        
                        Button {
                            phoneNumbers.remove(at: i)
                        } label: {
                            Image(systemName: "minus.circle.fill")
                                .foregroundColor(.red)
                        }
                    }
                }
                
                Button {
                    withAnimation{
                        phoneNumbers.append("")
                    }
                } label: {
                    HStack{
                        Image(systemName: "plus")
                        Text("Add number")
                    }
                }
            }
            
            Section{
                ForEach(emails.indices, id: \.self){ i in
                    HStack{
                        TextField("Email", text: $emails[i])
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                        
                        Button {
                            emails.remove(at: i)
                        } label: {
                            Image(systemName: "minus.circle.fill")
                                .foregroundColor(.red)
                        }
                    }.animation(.easeInOut, value: emails)
                    
                }
                
                Button {
                    withAnimation{
                        emails.append("")
                    }
                } label: {
                    HStack{
                        Image(systemName: "plus")
                        Text("Add email")
                    }
                }
            }
            
            Section{
                Text("Address")
                TextEditor(text: $address)
                    .textInputAutocapitalization(.words)
            }
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Done") {
                    let contactIndex = contacts.firstIndex { $0.id == self.id }
                    let contact = contacts[contactIndex!]
                    
                    contact.firstName = firstName
                    contact.lastName = lastName
                    contact.address = address
                    contact.emails = emails
                    contact.phoneNumbers = phoneNumbers
                    
                    if moc.hasChanges{
                        try? moc.save()
                    }
                    
                    withAnimation{
                        doneEditing = false
                    }
                }
            }
        }
    }
}
