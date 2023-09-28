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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func didTappedSFSafariViewButton(_ sender: Any) {
        let url = URL(string: "http://google.co.jp")!
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
    
    @IBAction func didTappedWKWebViewButton(_ sender: Any) {
        let naviVC = UINavigationController(rootViewController: WebViewController(url: URL(string: "http://google.co.jp")!))
        
        naviVC.navigationBar.isTranslucent = false
        naviVC.modalPresentationStyle = .fullScreen
        naviVC.navigationBar.setBackgroundImage(UIImage(), for: .default)
        naviVC.navigationBar.shadowImage = UIImage()
        naviVC.navigationBar.barTintColor = .systemBackground
        present(naviVC, animated: true)
    }
    
}


