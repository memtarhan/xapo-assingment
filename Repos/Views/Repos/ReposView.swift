//
//  ReposView.swift
//  Repos
//
//  Created by Mehmet Tarhan on 04/05/2023.
//

import SwiftUI

struct ReposView: View {
    @StateObject var model = ReposModel()
    @State var filter = TrendingFilter.daily
    @State var shouldShowSignOut = false
    @State var shouldNavigateToOnboarding = false

    var body: some View {
        NavigationView {
            if let errorMessage = model.errorMessage {
                Text(errorMessage)
                    .font(.title.bold())
                    .padding()

            } else {
                if #available(iOS 15, *) {
                    ReposList(model: .constant(model), filter: $filter)
                        .refreshable {
                            model.refresh(filter)
                        }
                        .toolbar {
                            ToolbarItemGroup(placement: .navigationBarLeading) {
                                Button {
                                    shouldShowSignOut.toggle()
                                } label: {
                                    Image(systemName: "person.badge.key")
                                }
                            }
                        }
                        .fullScreenCover(isPresented: $shouldNavigateToOnboarding, content: OnboardingView.init)

                } else {
                    // TODO: Add pull to refresh for iOS 14, refreshable is available for iOS15 and later
                    // TODO: Refresh feature is handled by a button on navigation bar
                    ReposList(model: .constant(model), filter: $filter)
                        .toolbar {
                            ToolbarItemGroup(placement: .navigationBarTrailing) {
                                Button {
                                    model.refresh(filter)
                                } label: {
                                    Image(systemName: "arrow.clockwise")
                                }
                            }
                            ToolbarItemGroup(placement: .navigationBarLeading) {
                                Button {
                                    shouldShowSignOut.toggle()
                                } label: {
                                    Image(systemName: "person.badge.key")
                                }
                            }
                        }
                        .fullScreenCover(isPresented: $shouldNavigateToOnboarding, content: OnboardingView.init)
                }
            }
        }
        .alert(isPresented: $shouldShowSignOut) {
            Alert(
                title: Text("Are you sure you want to sign out?"),
                primaryButton: .destructive(Text("Sign Out")) {
                    LocalStorage.shared.signedIn = false
                    shouldNavigateToOnboarding = true
                },
                secondaryButton: .cancel()
            )
        }
        .onAppear {
            model.load(filter)
        }
    }
}

struct ReposList: View {
    @Binding var model: ReposModel
    @Binding var filter: TrendingFilter
    var filters = TrendingFilter.allCases

    var body: some View {
        GeometryReader { geometry in
            List {
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
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(model.featuredRepos) { repo in
                            NavigationLink {
                                RepoDetailView(repo: repo)
                            } label: {
                                FeaturedView(repo: repo)
//                                    .frame(width: GeometryParameters.getFeaturedCardFrame(size: geometry.size).width,
//                                           height: GeometryParameters.getFeaturedCardFrame(size: geometry.size).height)
                            }
                        }
                    }
                }
                ForEach(model.repos) { repo in
                    NavigationLink {
                        RepoDetailView(repo: repo)

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
}

struct ReposView_Previews: PreviewProvider {
    static var previews: some View {
        ReposView()
    }
}
