//
//  ViewController.swift
//  WebViewLauncher
//
//  Created by tanabe.nobuyuki on 2023/09/28.
//

import UIKit
import SafariServices

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
    }
    
}

