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
        VStack {
            Text(repo.title)
        }
    }
}

struct RepoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RepoDetailView(repo: .constant(RepoDisplayModel.sample))
    }
}
