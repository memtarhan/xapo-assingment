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
                        RepoRow()
                            .padding()
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Trending Repos")
        }
    }
}

struct RepoRow: View {
    var body: some View {
        HStack {
            HStack(alignment: .center) {
                Image("repo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color.accentColor.opacity(0.7))
                    .frame(width: 24, height: 30)
                Text("Repo title")
                    .font(.subheadline)
            }
            HStack {
                Spacer()

                HStack(spacing: 0) {
                    Image("fork")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.accentColor.opacity(0.7))
                        .frame(width: 24, height: 24)
                    Text("2.5k")
                        .font(.headline)
                }

                HStack(spacing: 0) {
                    Image("star")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.accentColor.opacity(0.7))
                        .frame(width: 24, height: 24)
                    Text("2.5k")
                        .font(.headline)
                }
            }
        }
    }
}

struct ReposView_Previews: PreviewProvider {
    static var previews: some View {
        ReposView()
    }
}
