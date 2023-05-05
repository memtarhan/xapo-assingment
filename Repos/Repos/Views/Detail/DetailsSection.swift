//
//  DetailsSection.swift
//  Repos
//
//  Created by Mehmet Tarhan on 05/05/2023.
//

import SwiftUI

struct DetailsSection: View {
    var details: RepoDetailsDisplayModel

    var body: some View {
        if #available(iOS 15, *) {
            Section("Details") {
                DetailRows(details: details)
            }

        } else {
            DetailRows(details: details)
        }
    }
}

struct DetailRows: View {
    var details: RepoDetailsDisplayModel

    var body: some View {
        NavigationLink {
            WebContainerView(view: WebView(), url: details.url, title: details.name)
        } label: {
            HStack {
                Text("Name")
                    .font(.footnote)
                Spacer()
                Text(details.name)
                    .font(.headline)
                    .foregroundColor(.primary)
            }
            .foregroundColor(.primary)
        }

        HStack {
            Text("Full Name")
                .font(.footnote)
            Spacer()
            Text(details.fullName)
                .font(.headline)
        }
        .foregroundColor(.primary)

        HStack {
            DetailIconImage(imageName: "calendar")
            Text("Created At")
                .font(.footnote)
            Spacer()
            Text(details.createdAt)
                .font(.headline)
        }
        .foregroundColor(.primary)

        HStack {
            DetailIconImage(imageName: "calendar")
            Text("Updated At")
                .font(.footnote)
            Spacer()
            Text(details.updatedAt)
                .font(.headline)
        }
        .foregroundColor(.primary)

        HStack {
            DetailIconImage(imageName: "calendar")
            Text("Pushed At")
                .font(.footnote)
            Spacer()
            Text(details.pushedAt)
                .font(.headline)
        }
        .foregroundColor(.primary)
    }
}

struct DetailsSection_Previews: PreviewProvider {
    static var previews: some View {
        DetailsSection(details: RepoDetailsDisplayModel.sample)
    }
}
