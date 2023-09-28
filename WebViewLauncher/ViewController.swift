//
//  ViewController.swift
//  WebViewLauncher
//
//  Created by tanabe.nobuyuki on 2023/09/28.
//

import UIKit
import SafariServices
import WebKit


class ViewController: UIViewController {
    
    static let urlString = "https://google.co.jp"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [.font: UIFont.boldSystemFont(ofSize: 20.0),
                                          .foregroundColor: UIColor.white]

        // Customizing our navigation bar
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    @IBAction func didTappedSFSafariViewButton(_ sender: Any) {
        let url = URL(string: Self.urlString)!
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
    
    @IBAction func didTappedWKWebViewButton(_ sender: Any) {
        //        画面遷移をモーダルにする場合はこっちをコメントイン
        //        let naviVC = UINavigationController(rootViewController: WebViewController(url: URL(string: "http://google.co.jp")!))
        //
        //        naviVC.navigationBar.isTranslucent = false
        //        naviVC.modalPresentationStyle = .fullScreen
        //        naviVC.navigationBar.setBackgroundImage(UIImage(), for: .default)
        //        naviVC.navigationBar.shadowImage = UIImage()
        //        naviVC.navigationBar.barTintColor = .systemBackground
        self.navigationController?.pushViewController(WebViewController(url: URL(string: Self.urlString)!), animated: true)
    }
    
}


