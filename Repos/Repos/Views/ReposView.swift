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
                        RepoDetailView(repo: .constant(repo))

                    } label: {
                        RepoRow(model: .constant(repo))
                            .padding()
//                            .cardStyle()
                    }
                    .onAppear {
                        if repo == model.repos.last {
                            model.load()
                        }
                    }
                }
                if model.isLoading {
                    HStack {
                        Text("Loading...")
                        ProgressView()
                            .foregroundColor(.accentColor)
                        Spacer()
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

struct ReposView_Previews: PreviewProvider {
    static var previews: some View {
        ReposView()
    }
}
