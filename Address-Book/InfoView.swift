//
//  InfoView.swift
//  Address-Book
//
//  Created by Don Bouncy on 18/12/2022.
//

import SwiftUI

struct InfoView: View {
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
            EditButton()
        }
    }
}


struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(firstName: "hi", lastName: "hi", phoneNumbers: ["hi"], emails: ["hi"], address: "hi")
    }
}
