//
//  ReposView.swift
//  Repos
//
//  Created by Mehmet Tarhan on 04/05/2023.
//

import SwiftUI

struct ReposView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(0 ... 100, id: \.self) { index in
                    NavigationLink {
                        // Destination
                        Text("Selected item at #\(index)")

                    } label: {
                        VStack {
                            Text("Item at #\(index)")
                            Text("Info about this item")
                        }
                    }
                    
                }
            }
            .listStyle(.plain)
            .navigationTitle("Trending Repos")
        }
    }
}

struct ReposView_Previews: PreviewProvider {
    static var previews: some View {
        ReposView()
    }
}
