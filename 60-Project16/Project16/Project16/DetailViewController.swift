//
//  DetailViewController.swift
//  Project16
//
//  Created by ebdesk-066 on 08/07/19.
//  Copyright © 2019 irig.com. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    var cityName: String?
    
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let city = cityName else { return }
        title = city
        let baseUrl = "https://en.wikipedia.org/wiki/\(city)"
        if let url = URL(string: baseUrl){
            webView.load(URLRequest(url: url))
        }
    }
    

}
