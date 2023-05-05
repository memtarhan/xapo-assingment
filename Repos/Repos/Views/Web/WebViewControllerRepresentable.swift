//
//  WebViewControllerRepresentable.swift
//  Repos
//
//  Created by Mehmet Tarhan on 05/05/2023.
//

import SwiftUI
import UIKit

struct WebViewControllerRepresentable<WebView: View>: UIViewControllerRepresentable {
    var view: WebView
    var url: URL

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> WebViewController {
        // Modify WebViewController here
        WebViewController()
    }

    func updateUIViewController(_ uiViewController: WebViewController, context: Context) {
        uiViewController.loadView()
        uiViewController.url = url
    }

    class Coordinator: NSObject, WebViewControllerDelegate {
        var parent: WebViewControllerRepresentable
        var controller: UIViewController

        init(_ uiViewControllerRepresentable: WebViewControllerRepresentable) {
            parent = uiViewControllerRepresentable
            controller = UIHostingController(rootView: parent.view)
        }
    }
}
