//
//  HomeView.swift
//  Address-Book
//
//  Created by Don Bouncy on 17/12/2022.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var contacts: FetchedResults<Contacts>
    
    @State private var addEntry = false
    
    var body: some View {
        List {
            ForEach(contacts, id:\.self) { contact in
                NavigationLink {
                    DetailView(contact: contact)
                } label: {
                    Text("\(contact.wrappedFirstName) \(contact.wrappedLastName)")
                }
            }
            .onDelete(perform: deleteEntry)
        }
        .listStyle(.plain)
        .navigationTitle("Address Book")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $addEntry) {
            AddEntryView()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    addEntry.toggle()
                } label: {
                    Label("Add", systemImage: "plus")
                }
            }
        }
        
    }
    
    func deleteEntry(at offsets: IndexSet) {
        for offset in offsets{
            let contact = contacts[offset]
            moc.delete(contact)
        }
        
        if moc.hasChanges{
            try? moc.save()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HomeView()
        }
    }
}
