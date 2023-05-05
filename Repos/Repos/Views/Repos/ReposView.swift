//
//  ReposView.swift
//  Repos
//
//  Created by Mehmet Tarhan on 04/05/2023.
//

import SwiftUI

struct ReposView: View {
    @ObservedObject var model = ReposModel()

    var filters = TrendingFilter.allCases
    @State var filter = TrendingFilter.daily

    var body: some View {
        NavigationView {
            if let errorMessage = model.errorMessage {
                Text(errorMessage)
                    .font(.title.bold())
                    .padding()

            } else {
                VStack {
                    Picker("Filter timeline", selection: $filter) {
                        ForEach(filters, id: \.self) { filter in
                            Text(filter.rawValue.uppercased())
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    .onChange(of: filter) { newValue in
                        model.refresh(newValue)
                    }

                    if #available(iOS 15, *) {
                        ReposList(model: .constant(model), filter: $filter)
                            .refreshable {
                                model.refresh(filter)
                            }

                    } else {
                        // TODO: Add pull to refresh for iOS 14, refreshable is available for iOS15 and later
                        ReposList(model: .constant(model), filter: $filter)
                            .toolbar {
                                ToolbarItemGroup(placement: .navigationBarTrailing) {
                                    Button {
                                        model.refresh(filter)
                                    } label: {
                                        Image(systemName: "arrow.clockwise")
                                    }
                                }
                            }
                    }
                }
            }
        }
        .onAppear {
            model.load(filter)
        }
    }
}

struct ReposList: View {
    @Binding var model: ReposModel
    @Binding var filter: TrendingFilter

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
                        model.load(filter)
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
