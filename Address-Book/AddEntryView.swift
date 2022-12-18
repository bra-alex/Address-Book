//
//  AddEntryView.swift
//  Address-Book
//
//  Created by Don Bouncy on 17/12/2022.
//

import SwiftUI

struct AddEntryView: View {
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
                    TextField("Last Name", text: $lastName)
                }
                
                Section{
                    ForEach(phoneNumbers.indices, id: \.self){ i in
                        HStack{
                            TextField("Phone Number", text: $phoneNumbers[i])
                                .keyboardType(.phonePad)
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
                            Text("Add another number")
                        }
                    }
                }
                
                Section{
                    ForEach(emails.indices, id: \.self){ i in
                        HStack{
                            TextField("Email", text: $emails[i])
                                .keyboardType(.emailAddress)
                            
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
                            Text("Add another email")
                        }
                    }
                }
                
                Section{
                    Text("Address")
                    TextEditor(text: $address)
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
