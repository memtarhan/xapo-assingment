//
//  ReposView.swift
//  Repos
//
//  Created by Mehmet Tarhan on 04/05/2023.
//

import SwiftUI

struct ReposView: View {
    @ObservedObject var model = ReposModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(model.repos) { repo in
                    NavigationLink {
                        // Destination
                        Text("Selected item at #\(repo.id)")

                    } label: {
                        RepoRow(model: .constant(repo))
                            .padding()
                    }
                    .onAppear {
                        if repo == model.repos.last {
                            model.load()
                        }
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Trending Repos")
        }
        .onAppear {
            model.load()
        }
    }
}

struct RepoRow: View {
    @Binding var model: RepoDisplayModel

    var body: some View {
        HStack {
            HStack(alignment: .center) {
                Image("repo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color.accentColor.opacity(0.7))
                    .frame(width: 24, height: 30)
                Text(model.title)
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
