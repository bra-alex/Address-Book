//
//  AddEntryView.swift
//  Address-Book
//
//  Created by Don Bouncy on 17/12/2022.
//

import SwiftUI

struct AddEntryView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var emails = [String]()
    @State private var phoneNumbers = [String]()
    @State private var address = ""
    
    var body: some View {
        NavigationView{
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
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        let contacts = Contacts(context: moc)
                        contacts.id = UUID()
                        contacts.firstName = firstName
                        contacts.lastName = lastName
                        contacts.address = address
                        contacts.emails = emails
                        contacts.phoneNumbers = phoneNumbers
                        
                        try? moc.save()
                        
                        dismiss()
                    }
                }
            }
        }
    }
}

struct AddEntryView_Previews: PreviewProvider {
    static var previews: some View {
        
        AddEntryView()
        
    }
}
