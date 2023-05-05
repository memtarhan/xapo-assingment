//
//  WebViewController.swift
//  Repos
//
//  Created by Mehmet Tarhan on 05/05/2023.
//

import UIKit
import WebKit

// MARK: This delegate helps to get updates/info from WebViewController

protocol WebViewControllerDelegate: AnyObject {}

class WebViewController: UIViewController {
    private var webView: WKWebView!

    var url: URL? {
        didSet {
            guard let url else { return }
            webView.load(URLRequest(url: url))
            webView.allowsBackForwardNavigationGestures = true
        }
    }

    weak var delegate: WebViewControllerDelegate?

    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
}

// MARK: - WKNavigationDelegate

// TODO: Add any needed navigation methods here
extension WebViewController: WKNavigationDelegate {}
