//
//  DetailViewController.swift
//  Project7
//
//  Created by ebdesk-066 on 11/06/19.
//  Copyright © 2019 irig.com. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    var webView: WKWebView!
    var detailItem: Petition?
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let detailItem = detailItem else {
            return
        }
        
        let html = """
            <html>
            <head>
            <meta name="viewport" content=" width=device-width, initial-scale=1">
            <style> body{ font-size:150%; } </style>
            </head>
            <body>
            <h3>\(detailItem.title)</h3>
            \(detailItem.body)
            </body>
            </html>
        """
        
        webView.loadHTMLString(html, baseURL: nil)
    }

}
