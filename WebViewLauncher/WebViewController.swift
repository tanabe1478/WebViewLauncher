//
//  WebViewController.swift
//  WebViewLauncher
//
//  Created by tanabe.nobuyuki on 2023/09/28.
//

import Foundation
import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    private var webView: WKWebView!
    private var backButton: UIBarButtonItem!
    private var reloadButton: UIBarButtonItem!
    private var closeButton: UIBarButtonItem!

    
    private let initialURL: URL
    
    init(url: URL) {
        self.initialURL = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupWebView()
        setupNavigationBar()
        loadInitialURL()
    }
    
    private func setupWebView() {
        webView = WKWebView(frame: .zero)
        webView.navigationDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(webView)
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupNavigationBar() {
        backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonTapped))
        closeButton = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(closeButtonTapped))
        reloadButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(reloadButtonTapped))
        
        navigationItem.leftBarButtonItems = [closeButton, backButton]
        navigationItem.rightBarButtonItem = reloadButton

        
        backButton.isEnabled = false
    }
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    private func loadInitialURL() {
        let request = URLRequest(url: initialURL)
        webView.load(request)
    }
    
    @objc private func backButtonTapped() {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @objc private func reloadButtonTapped() {
        webView.reload()
    }
    
    // MARK: - WKNavigationDelegate
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        backButton.isEnabled = webView.canGoBack
    }
}
