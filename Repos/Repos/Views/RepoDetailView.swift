//
//  RepoDetailView.swift
//  Repos
//
//  Created by Mehmet Tarhan on 04/05/2023.
//

import SwiftUI

struct RepoDetailView: View {
    @Binding var repo: RepoDisplayModel

    var body: some View {
        RepoDetailSubview(repo: $repo)
            .navigationTitle(repo.name)
    }
}

struct RepoDetailSubview: View {
    @Binding var repo: RepoDisplayModel

    var body: some View {
        if #available(iOS 15, *) {
            List {
                Section("Owner") {
                    HStack {
                        AsyncImage(url: URL(string: repo.owner.avatarUrl)) { image in
                            image.resizable()
                        } placeholder: {
                            Color.accentColor
                        }
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())

                        Link(repo.owner.username, destination: repo.owner.profileURL)
                            .font(.headline)
                            .foregroundColor(.blue)
                    }
                }
                Section("Stats") {
                    HStack {
                        // TODO: Move this Image to a custom view since it's used repeatedly
                        DetailIconImage(imageName: "tuningfork")
                        Text("Forks")
                            .font(.footnote)
                        Spacer()
                        Text(repo.forks)
                            .font(.headline)
                    }
                    .foregroundColor(.primary)

                    HStack {
                        DetailIconImage(imageName: "star")
                        Text("Stars")
                            .font(.footnote)
                        Spacer()
                        Text(repo.stars)
                            .font(.headline)
                    }
                    .foregroundColor(.primary)

                    HStack {
                        DetailIconImage(imageName: "eye")
                        Text("Watchers")
                            .font(.footnote)
                        Spacer()
                        Text(repo.watchers)
                            .font(.headline)
                    }
                    .foregroundColor(.primary)
                }
                Section("Details") {
                    HStack {
                        Text("Name")
                            .font(.footnote)
                        Spacer()
                        Link(repo.name, destination: repo.url)
                            .font(.headline)
                            .foregroundColor(.blue)
                    }
                    .foregroundColor(.primary)

                    HStack {
                        Text("Full Name")
                            .font(.footnote)
                        Spacer()
                        Text(repo.fullName)
                            .font(.headline)
                    }
                    .foregroundColor(.primary)

                    HStack {
                        DetailIconImage(imageName: "calendar")
                        Text("Created At")
                            .font(.footnote)
                        Spacer()
                        Text(repo.createdAt)
                            .font(.headline)
                    }
                    .foregroundColor(.primary)

                    HStack {
                        DetailIconImage(imageName: "calendar")
                        Text("Updated At")
                            .font(.footnote)
                        Spacer()
                        Text(repo.updatedAt)
                            .font(.headline)
                    }
                    .foregroundColor(.primary)

                    HStack {
                        DetailIconImage(imageName: "calendar")
                        Text("Pushed At")
                            .font(.footnote)
                        Spacer()
                        Text(repo.pushedAt)
                            .font(.headline)
                    }
                    .foregroundColor(.primary)
                }

                if let description = repo.description {
                    Section("Description") {
                        Text(description)
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                }
            }

        } else {
            // TODO: Implement list for iOS14
            VStack {
            }
        }
    }
}

struct DetailIconImage: View {
    var imageName: String

    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 28)
            .foregroundColor(.accentColor)
    }
}

struct RepoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RepoDetailView(repo: .constant(RepoDisplayModel.sample))
    }
}
