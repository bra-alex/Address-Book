//
//  DetailView.swift
//  Address-Book
//
//  Created by Don Bouncy on 17/12/2022.
//

import SwiftUI

struct DetailView: View {
    @State private var edit = false
    var body: some View {
        List {
            Text("Dummy UI")
                .font(.title.bold())
                .frame(maxWidth: .infinity, alignment: .center)
            
            Section("Phone Number") {
                ForEach(0..<2) { i in
                    VStack(alignment: .leading) {
                        Text(i.formatted())
                    }
                }
            }
            
            Section("Email") {
                ForEach(0..<2) { i in
                    VStack(alignment: .leading) {
                        Text(i.formatted())
                    }
                }
            }
            
            Section("Address") {
                Text("Address")
            }
        }
        .toolbar {
            EditButton()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            DetailView()
        }
    }
}
