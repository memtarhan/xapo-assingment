//
//  WebContainerView.swift
//  Repos
//
//  Created by Mehmet Tarhan on 05/05/2023.
//

import SwiftUI

struct WebContainerView: View {
    var view: WebView
    var url: URL
    var title: String

    var body: some View {
        WebViewControllerRepresentable(view: view, url: url)
            .navigationTitle(title)
    }
}

struct WebContainerView_Previews: PreviewProvider {
    static var previews: some View {
        WebContainerView(view: WebView(), url: URL(string: "https://github.com/memtarhan")!, title: "memtarhan")
    }
}
