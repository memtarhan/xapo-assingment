//
//  OwnerSection.swift
//  Repos
//
//  Created by Mehmet Tarhan on 05/05/2023.
//

import SwiftUI

struct OwnerSection: View {
    var owner: RepoOwnerDisplayModel

    var body: some View {
        if #available(iOS 15, *) {
            Section("Owner") {
                NavigationLink {
                    WebContainerView(view: WebView(), url: owner.profileURL, title: owner.username)
                } label: {
                    HStack {
                        AsyncImage(url: URL(string: owner.avatarUrl)) { image in
                            image.resizable()
                        } placeholder: {
                            Color.accentColor
                        }
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())

                        Text(owner.username)
                            .font(.headline)
                            .foregroundColor(.primary)
                    }
                }
            }

        } else {
            NavigationLink {
                WebContainerView(view: WebView(), url: owner.profileURL, title: owner.username)
            } label: {
                HStack {
                    Image(systemName: "photo").data(url: URL(string: owner.avatarUrl)!)
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())

                    Text(owner.username)
                        .font(.headline)
                        .foregroundColor(.primary)
                }
            }
        }
    }
}


struct OwnerSection_Previews: PreviewProvider {
    static var previews: some View {
        OwnerSection(owner: RepoOwnerDisplayModel.sample)
    }
}
