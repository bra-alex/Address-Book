//
//  HomeView.swift
//  Address-Book
//
//  Created by Don Bouncy on 17/12/2022.
//

import SwiftUI

struct HomeView: View {
    @State private var addEntry = false
    var body: some View {
        List {
            ForEach(0..<10) { i in
                NavigationLink {
                    DetailView()
                } label: {
                    Text(i.formatted())
                }
            }
            .onDelete(perform: deleteEntry)
            .sheet(isPresented: $addEntry) {
                AddEntryView()
            }
        }
        .listStyle(.plain)
        .navigationTitle("Address Book")
        .navigationBarTitleDisplayMode(.inline)
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
    
    func deleteEntry(at offset: IndexSet) {
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HomeView()
        }
    }
}
