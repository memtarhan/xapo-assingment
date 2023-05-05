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
            if let errorMessage = model.errorMessage {
                Text(errorMessage)
                    .font(.title.bold())
                    .padding()

            } else {
                if #available(iOS 15, *) {
                    ReposList(model: .constant(model))
                        .refreshable {
                            model.refresh()
                        }

                } else {
                    // TODO: Add pull to refresh for iOS 14, refreshable is available for iOS15 and later
                    ReposList(model: .constant(model))
                        .toolbar {
                            ToolbarItemGroup(placement: .navigationBarTrailing) {
                                Button {
                                    model.refresh()
                                } label: {
                                    Image(systemName: "arrow.clockwise")
                                }
                            }
                        }
                }
            }
        }
        .onAppear {
            model.load()
        }
    }
}

struct ReposList: View {
    @Binding var model: ReposModel

    var body: some View {
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
}

struct ReposView_Previews: PreviewProvider {
    static var previews: some View {
        ReposView()
    }
}
